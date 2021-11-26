class Diary < ApplicationRecord
  belongs_to :user

  # 西暦表示
  def ad_display
    self.date.strftime("%Y") + "年 " + self.date.strftime("%m") + "月 " + self.date.strftime("%d") + "日"
  end

# 一日一投稿に制限,空白制限
  validates :date, uniqueness: true,presence: true
  validates :artist, presence: true
  validates :music, presence: true

end
