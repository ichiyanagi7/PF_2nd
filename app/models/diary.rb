class Diary < ApplicationRecord
  belongs_to :user

  # 西暦表示
  def ad_display
    self.date.strftime("%Y") + "年 " + self.date.strftime("%m") + "月 " + self.date.strftime("%d") + "日"
  end

end
