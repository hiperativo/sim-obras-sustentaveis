class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :super_admin?
  def super_admin?
  	request.local?
  end
end
