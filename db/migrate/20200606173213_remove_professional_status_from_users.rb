class RemoveProfessionalStatusFromUsers < ActiveRecord::Migration[6.0]
  def change

    remove_column :users, :professional_status, :boolean
  end
end
