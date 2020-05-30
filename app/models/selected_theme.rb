class SelectedTheme < ApplicationRecord
  belongs_to :user
  belongs_to :theme
  validates :user_id, uniqueness: { scope: :theme_id }
end
