class AddAcceptedToMatchingProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :matching_profiles, :accepted, :boolean
  end
end
