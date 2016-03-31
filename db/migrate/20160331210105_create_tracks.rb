class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name
      t.text :lyrics
      t.references :album, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :tracks, :album
  end
end
