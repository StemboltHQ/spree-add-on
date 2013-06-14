class CreateSpreeLineItemAddOns < ActiveRecord::Migration
  def change
    create_table :spree_line_item_add_ons do |t|
      t.references :add_on
      t.references :line_item

      t.timestamps
    end
  end
end
