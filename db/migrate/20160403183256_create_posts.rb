class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :slug
      t.string :author_id
      t.string :type
      t.datetime :posted_at

      t.timestamps null: false
    end
    add_index :posts, :slug
    add_index :posts, :type
  end
end
