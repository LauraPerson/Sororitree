class AddHelperToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :helper, :boolean, default: false
  end
end
