require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Forpro
  class Application < Rails::Application
    config.middleware.use Rack::Deflater
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]

    config.eager_load_paths += ["#{config.root}/lib/workers"]
    
    config.assets.paths << "#{Rails.root}/app/assets/fonts"
    
    config.i18n.default_locale = :ru
    config.active_record.raise_in_transactional_callbacks = true

    config.generators.stylesheets = false
    config.generators.javascripts = false
    config.generators.helper = false

  end
end
