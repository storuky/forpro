class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_company
  after_action :set_csrf_cookie
  
  helper_method :current_company
  
  layout proc {
    if request.xhr?
      false
    else
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

    def cache_if(condition, name = {}, options = nil, &block)
      if condition
        Rails.cache.fetch(name, options, &block)
      else
        yield
      end
    end

    def current_company
      Company.current_company
    end

  private
    def set_csrf_cookie
      response.headers['X-CSRF-Token'] = form_authenticity_token if protect_against_forgery?
    end

    def set_company
      Company.current_company = OpenStruct.new Rails.application.secrets[:companies][request.host]
      ActionMailer::Base.default_url_options[:host] = "https://#{Company.current_company.name}.pro"
    end

end
