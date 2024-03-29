require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TodoApi
  class Application < Rails::Application
    config.middleware.insert_before 0, "Rack::Cors", :debug => true, :logger => (-> { Rails.logger }) do
      allow do
        origins '*'
        resource '*',
          headers: :any,
          methods: [:get, :post, :patch, :delete, :put, :options, :head],
          max_age: 0
      end
    end

    config.active_record.raise_in_transactional_callbacks = true
  end
end
