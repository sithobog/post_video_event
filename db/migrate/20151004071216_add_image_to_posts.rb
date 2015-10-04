class AddImageToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :image, :text
  end
end
