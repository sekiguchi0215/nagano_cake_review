# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
	email: "a@a",
	password: "aaaaaa"
)

Customer.create!(
	[
		{
			first_name: "森田",
			last_name: "仁志",
			first_name_kana: "モリタ",
			last_name_kana: "ヒトシ",
			email: "0@0",
			postal_code: "1234567",
			address: "大阪府大阪市中央区難波4−４−４ 難波御堂筋センタービル 8階",
			telephone_number: "09012345678",
			is_active: true,
			password: "000000"
		},

		{
			first_name: "春日",
			last_name: "俊彰",
			first_name_kana: "カスガ",
			last_name_kana: "トシアキ",
			email: "1@1",
			postal_code: "7654321",
			address: "東京都杉並区阿佐谷南1丁目25−24 むつみ荘",
			telephone_number: "08012345678",
			is_active: true,
			password: "111111"
		},

		{
			first_name: "両津",
			last_name: "勘吉",
			first_name_kana: "リョウツ",
			last_name_kana: "カンキチ",
			email: "2@2",
			postal_code: "8765432",
			address: "東京都葛飾区亀有公園前派出所",
			telephone_number: "07012345678",
			is_active: false,
			password: "222222"
		}
	]
)

Address.create!(
	[
		{
			customer_id: 1,
			name: "日向翔陽",
			postal_code: "2003801",
			destination: "宮城県烏野高校排球部"
		},

		{
			customer_id: 1,
			name: "石上千空",
			postal_code: "3062017",
			destination: "石神村"
		},

		{
			customer_id: 1,
			name: "竈門炭治郎",
			postal_code: "2152016",
			destination: "鬼殺隊本部"
		}
	]
)

Genre.create!(
	[
		{
			name: "ケーキ",
			is_active: true
		},

		{
			name: "焼き菓子",
			is_active: true
		},

		{
			name: "プリン",
			is_active: true
		},

		{
			name: "シュークリーム",
			is_active: false
		},

		{
			name: "アイス",
			is_active: false
		}
	]
)

for i in 1..10 do
	Item.create!(
		[
			{
				genre_id: 1,
				name: "ケーキ#{i}",
				introduction: "#{ 3 * i - 2 }番目の商品です。",
				price: rand(1..10) * 100,
				image: File.open("./app/assets/images/cake#{ i % 5 + 1 }.jpg"),
				is_active: true
			},

			{
				genre_id: 2,
				name: "クッキー#{i}",
				introduction: "#{ 3 * i - 1}番目の商品です。",
				price: rand(1..10) * 200,
				image: File.open("./app/assets/images/cookies#{ i % 5 + 1}.jpg"),
				is_active: true
			},

			{
				genre_id: 3,
				name: "プリン#{i}",
				introduction: "#{ 3 * i }番目の商品です。",
				price: rand(1..10) * 300,
				image: File.open("./app/assets/images/pudding#{ i % 5 + 1}.jpg"),
				is_active: false
			}
		]
	)
