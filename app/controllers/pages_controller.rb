class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

   def testpage
    @transaction = Transaction.new
  end

  def import
  end

  def home
  end

  def profile
    @category = Category.new
  end
end
