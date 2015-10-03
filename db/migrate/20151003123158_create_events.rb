class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.string :title, null: false
    	t.text :address, null: false
    	t.datetime :started_at, null: false

      t.timestamps null: false
    end
  end
end
