class ForProFormBuilder < OxymoronFormBuilder
  include ActionView::Helpers::TagHelper
  include ActionView::Context

  def text_field method, options = {}
    options[:class] ||= "form-control"
    super(method, options)
  end

  def email_field method, options = {}
    options[:class] ||= "form-control"
    super(method, options)
  end

  def text_area method, options = {}
    options[:class] ||= "form-control"
    super(method, options)
  end

end