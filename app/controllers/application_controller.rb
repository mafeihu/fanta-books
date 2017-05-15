class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  
  http_basic_authenticate_with name: ENV['FANTA_USERNAME'],
                            password: ENV['FANTA_PASSWORD'] if Proc.new{ request.fullpath =~ /^\/admin/}
 
end
