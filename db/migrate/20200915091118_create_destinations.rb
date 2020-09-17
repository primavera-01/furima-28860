class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.integer :prefecture_id,       null: false
      t.string  :post_code,        null: false
      t.string  :city,             null: false
      t.string  :house_number,     null: false
      t.string  :building_name  
      t.string  :telephone_number, null: false
      t.references :order,         null: false, forein_key: :true
      t.timestamps
    end
  end
end
