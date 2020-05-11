class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :brand
      t.string :model
      t.string :colorway
      t.integer :price
      t.string :condition

      t.timestamps
    end
  end
end
