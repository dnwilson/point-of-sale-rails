class CreateSaleItems < ActiveRecord::Migration[8.0]
  def change
    create_table :sale_items do |t|
      t.belongs_to :product, null: false, foreign_key: true
      t.belongs_to :sale, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :subtotal, precision: 8, scale: 2
      t.decimal :total, precision: 8, scale: 2

      t.timestamps
    end
  end
end
