class AddTypeToAddOn < ActiveRecord::Migration
  def change
    add_column :spree_add_ons, :type, :string
  end
end
