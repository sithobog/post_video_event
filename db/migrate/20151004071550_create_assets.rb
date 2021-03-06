class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
    	t.text :filename, null: false
    	t.string :type, limit: 30
    	t.references :assetable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
