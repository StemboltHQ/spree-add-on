class CreateSpreeAddOnPrices < ActiveRecord::Migration
  def change
    create_table :spree_add_on_prices do |t|
      t.references :add_on
      t.decimal :amount, precision: 8, scale: 2, null: false
      t.string :currency

      t.timestamps
    end
  end
end
