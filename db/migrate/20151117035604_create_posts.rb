class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :title
      t.text :link
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
