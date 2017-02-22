class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.string :url
      t.integer :pv ,:default => 0
      t.references :user, foreign_key: true

      t.timestamps
    end
    #ビデオを新しい順に表示するときのため
    add_index :videos, [:user_id, :created_at]
  end
end
