SimObrasSustentaveis::Application.configure do
  $stdout.sync = true
  config.cache_classes = false
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  config.action_mailer.raise_delivery_errors = false
  config.active_support.deprecation = :log
  config.assets.debug = true
  config.eager_load = false
end

