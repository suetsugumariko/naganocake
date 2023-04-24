class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items,dependent: :destroy


  # #退会ユーザーはログインできなくする
   #def active_for_authentication?
    # super && (is_deleted == true)
   #end

end
