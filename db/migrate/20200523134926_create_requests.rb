class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.integer :age
      t.integer :distance
      t.references :user, null: false, foreign_key: true
      t.references :theme, null: false, foreign_key: true

      t.timestamps
    end
  end
end
