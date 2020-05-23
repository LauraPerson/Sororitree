class Theme < ApplicationRecord
  has_many :selected_themes
  has_many :posts
  has_many :requests
end
