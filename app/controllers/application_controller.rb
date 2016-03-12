class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_current_company
  before_action :set_current_user
  before_action :set_locale
  before_action :set_form_builder
  after_action :set_csrf_cookie
  
  helper_method :current_company
  helper_method :current_user
  
  layout proc {
    if request.xhr?
      false
    else
      set_gon
      'application'
    end
  }


  protected
    def serialize res, options = {}
      serializer = options[:serializer] || "#{res.model_name.name}Serializer".constantize
      
      if res.respond_to?('each')
        ActiveModel::ArraySerializer.new(res, each_serializer: serializer, scope: self, root: false).as_json
      else
        serializer.new(res, scope: self, root: false).as_json
      end
    end

    def verify_captcha response
      result = RestClient.post("https://www.google.com/recaptcha/api/siteverify", secret: "6LcJqhoTAAAAAGdqEnh7deIT5UjmVlimHlJ1Ad1d", response: response)
      JSON.parse(result)["success"]
    end

    def cache_if(condition, name = {}, options = nil, &block)
      if condition
        Rails.cache.fetch(name, options, &block)
      else
        yield
      end
    end

    def dump res, options = {}
      if options[:serializer]
        Oj.dump serialize(res, options).as_json
      else
        Oj.dump res
      end
    end

    def current_company
      Company.current_company
    end

    def current_user
      User.current_user
    end

  private
    def set_csrf_cookie
      response.headers['X-CSRF-Token'] = form_authenticity_token if protect_against_forgery?
    end

    def set_current_company
      Company.current_company = OpenStruct.new Rails.application.secrets[:companies][request.host]
      ActionMailer::Base.default_url_options[:host] = "https://#{Company.current_company.name}.pro"
    end

    def set_current_user
      if session[:user_id]
        User.current_user = User.where(id: session[:user_id]).first
      else
        User.current_user = nil
      end
    end

    def set_locale
      if params[:lang].present?
        I18n.locale = params[:lang]
        
        if current_user
          if current_user.locale != params[:lang]
            current_user.update(locale: params[:lang])
          end
        else
          session.locale = params[:lang]
        end
      else
        if current_user
          I18n.locale = current_user.locale
        else
          I18n.locale = session[:locale] || extract_locale
        end
      end
    end

    def set_gon
      gon.data = {
        weight_dimensions: WeightDimension.all_from_cache(serializer: WeightDimensionSerializer),
        currencies: Currency.all_from_cache(serializer: CurrencySerializer),
        products: Product.all_from_cache(serializer: ProductSerializer),
        categories: Category.all_from_cache(serializer: CategorySerializer),
        trade_type: I18n.t("trade_type"),
        markers: Position.colors.map {|t| {name: t}}.select{|t| t[:name].include?(current_company.name)}
      }

      gon.current_user = current_user.public_fields rescue nil

      gon.translations = {
        position: I18n.t("activerecord.attributes.position")
      }
    end

    def set_form_builder
      ActionView::Base.default_form_builder = ForProFormBuilder
    end

    def extract_locale
      if request.env['HTTP_ACCEPT_LANGUAGE']
        request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
      else
        :en
      end
    end
end
