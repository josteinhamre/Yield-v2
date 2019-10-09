class DashboardController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  respond_to :json

  def balance_data
    get_transactions
    @chart_balance_per_day = []

    respond_to do |format|
      format.html { render "balance_data.json" }
      format.js
    end
  end

  def spent_data
    get_transactions
    @chart_spent_per_day = []
    date = Date.parse("1 #{@selected_month}")
    end_of_month = (date >> 1) - date.day
    num_days = end_of_month.day
    (1..num_days).each do |day|
      @chart_spent_per_day << get_day_spent_amount(day)
    end
    respond_to do |format|
      format.html { render "spent_data.json" }
      format.js
    end
  end

  def budgeted_data

  end

  protected

  def get_day_spent_amount(day)
    amount = 0
    if @transactions.length.positive?
      day_trans = @transactions.where("extract(day from datetime) = #{day}")
      amount = day_trans.sum(:amount_cents) / 100 if day_trans.length.positive?
    end
    amount
  end
end

# step1: Controller with 3 actions for each charts that responds in json format
# step2: parameter will be month and year (what controller will require)
# step3: make sure returning json and test
# setp4:
