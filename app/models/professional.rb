

class Professional < ApplicationRecord
  belongs_to :user
  has_many :matching_profiles
  validates :job_category, presence: true

  CATEGORIES = ["Médica - outros", "Enfermeira", "Psicóloga", "Psiquiatra", "Assistente Social", "Ginecologista", "Doula", "Advogada", "Policial", "Nutricionista", "Coach" ]
end
