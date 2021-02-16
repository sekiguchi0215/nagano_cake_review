class CartItem < ApplicationRecord
	belongs_to :customer
	belongs_to :item

	validates :item_id, uniqueness: { scope: :customer_id }
	# "scope: :customer_id"とすることで、"customer_id"で範囲を限定している。
	validates :amount, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
	# "numericality"は、入力される値が数値であることを指定する。
	# "greater_than_or_equal_to"　は、指定された値と等しいか、それよりも大きくなければならないことを指定する。
	# "less_than_or_equal_to"　   は、指定された値を等しいか、それよりも小さくなければならないことを指定する。

	# 総合して、1種類の商品に対して、1回の注文に限定する。個数は１〜１０まで。というバリデーションを設定している。

	def subtotal
		item.with_tax_price * amount
	end
end
