class Item < ApplicationRecord
	belongs_to :genre
	has_many :cart_items, dependent: :destroy
	has_many :order_details

	validates :name, presence: true
	validates :introduction, presence: true
	validates :price, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
	attachment :image

	scope :where_genre_active, -> { joins(:genre).where(genres: { is_active: true }) }

	def with_tax_price
		(price * 1.08 / 100.0).ceil
	end
	# ceilメソッドを用いると、小数点を切り上げることができる。floorメソッドは切り捨て、roundメソッドは四捨五入。

	def self.recommended
		recommends = []
		active_genres = Genre.only_active.includes(:items)
		# includesメソッドは、SQL文を必要以上に発行しないよう、事前に必要なデータを読み込んでおくために設定している。
		active_genres.each do |genre|
			item = genre.items.last
			# lastメソッドは、配列の中の最後の要素を取得する。
			recommends << item if item
		end
		recommends
	end
	# おすすめ機能？
end
