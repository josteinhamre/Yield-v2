class CategoriesController < ApplicationController

  def index
  end

  def prev_month
    @selected_month << 1
  end

  def next_month
    @selected_month >> 1
  end
end
