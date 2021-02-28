class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders

  scope :only_active, -> { where(is_active: true) } # is_activeカラムがtrueのものに限定するためのscope。

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kane, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }  # 全角カタカナ
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } # 全角カタカナ
  validates :email, presence: true, uniqueness: true
  validates :postal_code, presence: true, format: { with: /\A\d{7}\z/ }			      # ハイフンなしの7桁
  validates :address, presence: true
  validates :telephone_number, presence: true, format: { with: /\A\d{10,11}\z/ }  # 電話番号（ハイフンなし10・11桁）

  def full_name
  	first_name + " " + last_name
  end

  def full_name_kana
  	first_name + " " + last_name_kane
  end

  def has_in_cart(item)
  	cart_items.find_by(item_id: item.id)
  end
end
