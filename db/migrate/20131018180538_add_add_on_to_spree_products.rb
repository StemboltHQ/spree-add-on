class AddAddOnToSpreeProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :add_on, :boolean, default: false
  end
end
