class RemoveProfessionalFromRequests < ActiveRecord::Migration[6.0]
  def change
    remove_reference :requests, :professional, null: false, foreign_key: true
  end
end
