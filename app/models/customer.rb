class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validate :last_name, :first_name, :last_name_kana, :first_name_kana,
           :postal_code, :address, :telephone_number, :is_deleted

  has_many :cart_items

end
