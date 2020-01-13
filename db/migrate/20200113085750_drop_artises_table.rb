class DropArtisesTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :artises
  end
end
