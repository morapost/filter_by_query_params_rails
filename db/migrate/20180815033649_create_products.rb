class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :price
      t.string :category
      t.string :brand
      t.string :size
      t.string :discount
      t.string :color
      t.boolean :availability, default: false

      t.timestamps
    end
  end
end
