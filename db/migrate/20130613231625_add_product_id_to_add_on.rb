class AddProductIdToAddOn < ActiveRecord::Migration
  def change
    add_column :spree_add_ons, :product_id, :integer
    add_index :spree_add_ons, :product_id
  end
end
