Sidekiq.configure_server do |config|
  config.redis = { :url => 'redis://localhost:6379/12', :namespace => "analytick:#{Rails.env}" }
end

Sidekiq.configure_client do |config|
  config.redis = { :url => 'redis://localhost:6379/12', :namespace => "analytick:#{Rails.env}" }
end

