class HomesController < ApplicationController
  skip_before_action :require_sign_in!, only: [:about,:top]

  def top
    @today = Date.today
    from_date = Date.new(@today.year, @today.month, @today.beginning_of_month.day).beginning_of_week(:sunday)
    to_date = Date.new(@today.year, @today.month, @today.end_of_month.day).end_of_week(:sunday)
    @calendar_data = from_date.upto(to_date)

    @user = current_user
    if @user.present?
      @diaries = Diary.where(user_id: @user.id).order(:date)
    end
  end

  def about
  end

end
