class AddTagsToPost < ActiveRecord::Migration
  def change
  	add_column :posts, :tag_ids, :integer, array: true#, default: []
  	add_index :posts, :tag_ids, using: 'gin'
  end
end
