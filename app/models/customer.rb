class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  #退会ユーザーはログインできなくする
  def active_for_authentication?
    super && (is_valid == true)
  end
end
