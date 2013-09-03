class AddExpirationDaysToAddOns < ActiveRecord::Migration
  def change
    add_column :spree_add_ons, :expiration_days, :integer, default: nil
  end
end
