class CreateSpreeAddOns < ActiveRecord::Migration
  def change
    create_table :spree_add_ons do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
