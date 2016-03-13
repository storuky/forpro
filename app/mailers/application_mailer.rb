class ApplicationMailer < ActionMailer::Base
  layout 'mailer'
  include Devise::Controllers::UrlHelpers
  include Devise::Mailers::Helpers

  before_action :set_company

  helper_method :current_company

  private
    def set_company
      Company.current_company = OpenStruct.new Rails.application.secrets[:companies][ActionMailer::Base.default_url_options[:host]]
      ActionMailer::Base.default :from => I18n.t("mailer.#{Company.current_company.name}.from")
    end

    def current_company
      Company.current_company
    end
end
