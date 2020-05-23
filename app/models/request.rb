class Request < ApplicationRecord
  belongs_to :user
  belongs_to :theme
  has_many :matching_profiles
end
