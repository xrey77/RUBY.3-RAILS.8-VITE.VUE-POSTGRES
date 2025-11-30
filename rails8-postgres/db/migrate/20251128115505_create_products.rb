class CreateProducts < ActiveRecord::Migration[8.1]
  def change
    create_table :products do |t|
      t.string :category, null: true
      t.string :descriptions, null: false, index: {unique: true}
      t.integer :qty, default: 0
      t.string :unit, null: true
      t.decimal :costprice, default: 0.00
      t.decimal :sellprice, default: 0.00
      t.decimal :saleprice, default: 0.00
      t.string :productpicture, null: true
      t.integer :alertstocks, default: 0
      t.integer :criticalstocks, default: 0

      t.timestamps
    end
  end
end
