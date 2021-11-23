class DiariesController < ApplicationController
  def index
    @today = Date.today
    from_date = Date.new(@today.year, @today.month, @today.beginning_of_month.day).beginning_of_week(:sunday)
    to_date = Date.new(@today.year, @today.month, @today.end_of_month.day).end_of_week(:sunday)
    @calendar_data = from_date.upto(to_date)
  end

  def new
    @diary = Diary.new
  end

  def create
    diary = Diary.new(diary_params)
    diary.user_id = current_user.id
    if diary.save
      # リダイレクト先確認する！！
      redirect_to root_path
    else
      @diary = diary
      render :new
    end
  end

  def destroy

  end

  private

  def diary_params
    params.require(:diary).permit(:user_id, :artist, :music, :word,:date)
  end

end
