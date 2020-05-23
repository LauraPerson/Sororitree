class CreateSelectedThemes < ActiveRecord::Migration[6.0]
  def change
    create_table :selected_themes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :theme, null: false, foreign_key: true

      t.timestamps
    end
  end
end
