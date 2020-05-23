class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :requests
  has_many :posts
  has_many :selected_themes
  has_many :themes, through: :selected_themes
  has_many :matching_profiles
  has_many :messages
end
