class CreateSales < ActiveRecord::Migration[8.0]
  def change
    create_table :sales do |t|
      t.decimal :total, precision: 8, scale: 2
      t.decimal :tendered, precision: 8, scale: 2
      t.decimal :balance, precision: 8, scale: 2
      t.timestamps
    end
  end
end
