class CommentsToPolymorphic < ActiveRecord::Migration
  def change
    drop_table :comments

    create_table :comments do |t|
      t.string :title
      t.text :body
      t.references :commentable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
