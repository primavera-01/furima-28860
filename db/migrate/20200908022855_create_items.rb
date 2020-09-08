class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t. string :name
      t. text :introduction
      t. integer :price
      t. integer :image_id
      t. integer :condition
      t. integer :shipping_date
      t. integer :category_id
      t. integer :shipping_lcation
      t. references :user
      t.timestamps
    end
  end
end
