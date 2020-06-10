class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :user
  belongs_to :guest_user, class_name: "User"
  belongs_to :theme
  validates :guest_user, presence: true
end
