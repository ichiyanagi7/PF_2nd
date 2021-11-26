class DiariesController < ApplicationController

  def index
    user = current_user
    @diaries = Diary.where(user_id: user.id).group_by(&:year_month)
  end


  def new
    @diary = Diary.new
  end

  def create
    diary = Diary.new(diary_params)
    diary.user_id = current_user.id
    if diary.save
      diary.year_month = diary.date.strftime("%Y%m")
      if diary.update(diary_params)
        redirect_to root_path
      else
        @diary = diary
        render :new
      end
    else
      @diary = diary
      render :new
    end
  end

  def destroy
    diary = Diary.find(params[:id])
    diary.destroy
    redirect_to root_path
  end

  private

  def diary_params
    params.require(:diary).permit(:user_id, :artist, :music, :word,:date,:year_month)
  end

end
