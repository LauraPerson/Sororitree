class AddProfessionalStatusToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :professional_status, :boolean, default: false
  end
end
