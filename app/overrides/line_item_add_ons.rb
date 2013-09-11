# overrides the line item product name
Deface::Override.new(
  virtual_path: 'spree/orders/_line_item',
  name: 'updated_line_item_name',
  replace_contents: '[data-hook="cart_item_description"] h4',
  partial: 'spree/add_ons/line_item/product_name',
)

# overrides the line item description text
Deface::Override.new(
  virtual_path: 'spree/orders/_line_item',
  name: 'updated_line_item_description',
  replace_contents: '[data-hook="line_item_description"]',
  partial: 'spree/add_ons/line_item/description',
)

# adds the addons to the bottom of the line item
Deface::Override.new(
  virtual_path: 'spree/orders/_line_item',
  name: 'line_item_add_ons',
  insert_bottom: '[data-hook="cart_item_description"]',
  partial: 'spree/add_ons/line_item',
  original: 'ce2b7ddab2a6a13b25159ea18f6ab50991409d3e',
  disabled: false
)
