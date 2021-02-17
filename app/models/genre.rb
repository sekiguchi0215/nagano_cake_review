class Genre < ApplicationRecord
	has_many :items

	scope :only_active, -> { where(is_active: true) } # is_activeカラムがtrueのものに限定するためのscope。

	validates :name, presence: true, uniqueness: true
end
