class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :define_month

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end


  def default_url_options
  { host: ENV["DOMAIN"] || "localhost:3000" }
  end


  private

  def define_month
    if session[:selected_month]
      @selected_month = session[:selected_month]
    else
      @selected_month = Date.today.strftime("%B %y")
      session[:selected_month] = @selected_month
    end
    @selected_month_as_date = Date.parse("1 #{@selected_month}")
    @prev_month_as_date = (@selected_month_as_date << 1)
  end


  def prev_month
    session[:selected_month] = (@selected_month_as_date << 1).strftime("%B %y")
    define_month
  end

  def next_month
    session[:selected_month] = (@selected_month_as_date >> 1).strftime("%B %y")
    define_month
  end
end


