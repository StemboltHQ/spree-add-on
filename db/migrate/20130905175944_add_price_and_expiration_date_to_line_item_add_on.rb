class AddPriceAndExpirationDateToLineItemAddOn < ActiveRecord::Migration
  def change
    add_column :spree_line_item_add_ons, :price, :decimal, precision: 8, scale: 2
    add_column :spree_line_item_add_ons, :expiration_date, :datetime
  end
end
