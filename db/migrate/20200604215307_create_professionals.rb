class CreateProfessionals < ActiveRecord::Migration[6.0]
  def change
    create_table :professionals do |t|
      t.string :job_category
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
