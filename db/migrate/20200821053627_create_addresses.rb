class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :user_item, foreign_key: true
      t.string :postal_code
      t.string :phone_number
      t.string :city
      t.string :address
      t.string :building_name
      t.integer :prefectures_id
      t.timestamps
    end
  end
end
