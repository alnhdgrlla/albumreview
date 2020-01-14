class AddGenreReferenceToAlbum1 < ActiveRecord::Migration[6.0]
  def change
    add_reference :albums, :genre, foreign_key: true
  end
end
