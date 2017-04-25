Sidekiq.configure_server do |config|
  ActiveRecord::Base.configurations[Rails.env]['pool'] = 10
  ActiveRecord::Base.establish_connection
end