class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :spent_data]

  def home
  end

  def spent_data
    p 'hello'
    get_transactions
    @chart_spent_per_day = []

    date = Date.parse("1 #{@selected_month}")
    num_days = (date >> 1) - (date.day)
    (1..num_days).each do |day|
      day_trans = @transactions.where("extract(day from datetime) = #{day}")
      @chart_spent_per_day << day_trans.sum(:amount)
    end
  end
end
