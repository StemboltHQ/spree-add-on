class AddNameAndDescriptionToLineItem < ActiveRecord::Migration
  def change
    add_column :spree_line_items, :name, :string, default: nil
    add_column :spree_line_items, :description, :text, default: nil
  end
end
