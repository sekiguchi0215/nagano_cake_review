class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def created_at_jst
  	created_at.in_time_zone("Tokyo")
  end
  # "created_at"の時間を東京時間に変換するメソッド。
end
