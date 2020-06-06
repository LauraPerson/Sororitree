class AddThemeToChatrooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :chatrooms, :theme, null: false, foreign_key: true
  end
end
