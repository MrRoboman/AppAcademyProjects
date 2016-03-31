class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.references :band, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :albums, :band
  end
end
