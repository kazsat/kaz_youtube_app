class CreateVideoCategoryRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :video_category_relationships do |t|
      t.integer :video_id
      t.integer :category_id

      t.timestamps
    end
    add_index :video_category_relationships, :video_id
    add_index :video_category_relationships, :category_id
    add_index :video_category_relationships,[:video_id, :category_id],unique: true
  end
end
