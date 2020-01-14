class AddGenreToArtist < ActiveRecord::Migration[6.0]
  def change
    add_column :artists, :genre_name, :string
  end
end
