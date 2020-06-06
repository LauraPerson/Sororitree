class AddProfessionalToMatchingProfiles < ActiveRecord::Migration[6.0]
  def change
    add_reference :matching_profiles, :professional, null: false, foreign_key: true
  end
end
