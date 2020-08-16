class Theme < ApplicationRecord
  has_many :selected_themes
  has_many :posts
  has_many :requests
  has_many :chatrooms

  CATEGORIES = ["Violence conjugale", "Violence psychologique", "Violence Physique", \
  "Agressions sexuelles", "Harcèlement", "Avortement", "Sexualité", "Maternité", "Contraception", \
  "Droits des femmes", "Relations abusives", "Orientation professionnelle", \
  "Santé de la femme", "Égalité de genre"]
end
