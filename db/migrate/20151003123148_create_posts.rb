class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.string :title, null: false
    	t.string :slug, null: false
    	t.text :content, null: false


      t.timestamps null: false
    end
  end
end
