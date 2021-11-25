class Diary < ApplicationRecord
  belongs_to :user

  # 西暦表示
  def ad_display
    self.date.strftime("%Y") + "年 " + self.date.strftime("%m") + "月 " + self.date.strftime("%d") + "日"
  end

  # 月別表示
  # def divide_monthly
  #   return self.group("strftime('%Y%m',diaries.date)")
  #     .order(Arel.sql("strftime('%Y%m',diaries.date) desc"))
  #     .count
  # end

end
