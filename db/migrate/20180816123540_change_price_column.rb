class ChangePriceColumn < ActiveRecord::Migration[5.0]
  def up
    change_column :products, :price, :integer
  end

  def down
    change_column :products, :price, :string
  end
end
