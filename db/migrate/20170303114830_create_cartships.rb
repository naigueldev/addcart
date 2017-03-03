class CreateCartships < ActiveRecord::Migration[5.0]
  def change
    create_table :cartships do |t|
      t.integer :cart_id
      t.integer :product_id
      t.integer :quantity

      t.timestamps
    end
  end
end
