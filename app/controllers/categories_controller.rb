class CategoriesController < ApplicationController
  def index
  end

  def change_month
  end

  def prev_month
    super
    render action: :change_month
  end

  def next_month
    super
    render action: :change_month
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user
    @category.save
    respond_to do |format|
      format.html { redirect_to profile_path }
      format.js # <-- will render `app/views/categories/create.js.erb
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :color, :icon_id)
  end
end
