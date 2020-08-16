class Professional < ApplicationRecord
  belongs_to :user
  validates :job_category, presence: true
  validates :user, uniqueness: true

  CATEGORIES = ["Médecin - autres", "Infirmière", "Psychologue", "Psychiatre", "Assistante Sociale", "Gynécologiste", "Sage Femme", "Avocate", "Policière", "Nutricioniste", "Coach" ]
end
