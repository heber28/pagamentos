class ApplicationController < ActionController::Base
  include ControllerAuthentication
  protect_from_forgery
  before_filter :login_required
end
