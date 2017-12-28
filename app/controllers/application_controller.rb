require 'pry'
class ApplicationController < ActionController::API
  include Response
  include ActionController::MimeResponds
end
