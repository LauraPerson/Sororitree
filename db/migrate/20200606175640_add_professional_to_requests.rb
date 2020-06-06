class AddProfessionalToRequests < ActiveRecord::Migration[6.0]
  def change
    add_reference :requests, :professional, null: false, foreign_key: true
  end
end
