class AddGenreReferenceToArtist1 < ActiveRecord::Migration[6.0]
  def change
        add_reference :artists, :genre, foreign_key: true
  end
end
