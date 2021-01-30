require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GestorSalud
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    Sentry.init do |config|
      config.dsn = 'https://8a52a815c1ed4de386b23c46f7f87426@o513688.ingest.sentry.io/5616012'
      config.breadcrumbs_logger = [:active_support_logger]
    
      # To activate performance monitoring, set one of these options.
      # We recommend adjusting the value in production:
      # config.traces_sample_rate = 0.5
      # or
      config.traces_sampler = lambda do |context|
        true
      end
    end
  end
end

