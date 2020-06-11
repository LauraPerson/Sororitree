class CreateProfileAvatars < ActiveRecord::Migration[6.0]
  def change
    create_table :profile_avatars do |t|
      t.references :user
      t.references :avatar

      t.timestamps
    end
  end
end
