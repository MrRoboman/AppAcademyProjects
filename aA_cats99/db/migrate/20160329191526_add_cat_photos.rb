class AddCatPhotos < ActiveRecord::Migration
  def change
    add_column :cats, :image_url, :string
  end
end
