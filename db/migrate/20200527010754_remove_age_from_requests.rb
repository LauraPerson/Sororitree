class RemoveAgeFromRequests < ActiveRecord::Migration[6.0]
  def change

    remove_column :requests, :age, :integer
  end
end
