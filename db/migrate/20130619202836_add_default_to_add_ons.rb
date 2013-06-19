class AddDefaultToAddOns < ActiveRecord::Migration
  def change
    add_column :spree_add_ons, :default, :boolean, default: false
  end
end
