class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  attachment :profile_image

  varidates :name, uniqueness: true
  varidates :name, length: { in: 2..20 }
  varidates :introduction, length: { maximum: 50 }

end
