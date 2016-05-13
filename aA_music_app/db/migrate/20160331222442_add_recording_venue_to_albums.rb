class AddRecordingVenueToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :recording_venue, :string
  end
end
