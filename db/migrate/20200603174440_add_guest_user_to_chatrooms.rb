class AddGuestUserToChatrooms < ActiveRecord::Migration[6.0]
  def change
    change_table(:chatrooms) do |t|
      t.references :guest_user, foreign_key: { to_table: 'users' }
    end
  end
end
