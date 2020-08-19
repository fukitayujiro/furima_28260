class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :explain
      t.integer :price
      t.integer :category_id
      t.integer :item_status_id
      t.integer :sending_charge_id
      t.integer :sending_region_id
      t.integer :sending_day_id
      t.integer :user_id
      t.timestamps
    end
  end
end
