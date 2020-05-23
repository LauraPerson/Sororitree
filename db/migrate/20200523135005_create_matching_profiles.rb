class CreateMatchingProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :matching_profiles do |t|
      t.references :request, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
