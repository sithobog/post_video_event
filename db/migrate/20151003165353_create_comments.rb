class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.string :author_name, null: false
    	t.text :content, null: false
    	t.references :target, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
