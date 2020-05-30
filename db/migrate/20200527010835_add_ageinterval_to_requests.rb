class AddAgeintervalToRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :age_min, :integer
    add_column :requests, :age_max, :integer
  end
end
