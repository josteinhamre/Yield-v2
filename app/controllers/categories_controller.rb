class CategoriesController < ApplicationController

  def index
  end

  def prev_month
    p @selected_month
    @selected_month = (Date.parse("1 #{@selected_month}") << 1).strftime("%B %y")
    p @selected_month
    session[:selected_month] = @selected_month
  end

  def next_month
    p @selected_month
    @selected_month = (Date.parse("1 #{@selected_month}") >> 1).strftime("%B %y")
    p @selected_month
    session[:selected_month] = @selected_month
  end
end
