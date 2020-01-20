class RemoveUserReferenceFromSong < ActiveRecord::Migration[6.0]
  def change
    remove_column :songs, :user_id
  end
end
