class AddTagsToVideo < ActiveRecord::Migration
  def change
  	add_column :videos, :tag_ids, :integer, array: true, default: []
  	add_index :videos, :tag_ids, using: 'gin'
  end
end
