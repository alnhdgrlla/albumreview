class CreateArtises < ActiveRecord::Migration[6.0]
  def change
    create_table :artises do |t|
      t.string :name

      t.timestamps
    end
  end
end
