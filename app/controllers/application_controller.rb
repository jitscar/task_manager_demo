class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
  end

  protect_from_forgery with: :exception
  before_action :authenticate_user!
end
