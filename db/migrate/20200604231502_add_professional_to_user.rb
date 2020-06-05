class AddProfessionalToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :professional, :boolean
  end
end
