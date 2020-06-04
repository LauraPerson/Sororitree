class Professional < ApplicationRecord
  belongs_to :user
  validates :job_category, presence: true
  validates :description, presence: true
end
