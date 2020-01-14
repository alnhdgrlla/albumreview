class AddGenreReferenceToAlbums < ActiveRecord::Migration[6.0]
  def change
    add_column :albums, :genre_name, :string
  end
end
