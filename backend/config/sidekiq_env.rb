require_relative 'environment'

Sidekiq.configure_server do |config|
  config.error_handlers << Proc.new { |ex, ctx_hash| Bugsnag.notify(ex, ctx_hash) }
end
