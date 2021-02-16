class Address < ApplicationRecord
	belongs_to :customer

	validates :postal_code, presence: true, format: { with: /\A\d{7}\z/ }
	# "format: {with: 正規表現}"とすることで、正規表現と属性の値が合致するかの検証ができる。今回は、郵便番号（ハイフンあり７桁）で指定。

	validates :destination, presence: true
	validates :name, presence: true

	def finally_address
		"〒" + postal_code + " " + destination + " " + name
	end
end
