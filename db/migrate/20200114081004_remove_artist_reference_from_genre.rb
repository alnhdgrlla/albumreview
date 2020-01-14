class RemoveArtistReferenceFromGenre < ActiveRecord::Migration[6.0]
  def change
    remove_column :genres, :artist_id
  end
end
