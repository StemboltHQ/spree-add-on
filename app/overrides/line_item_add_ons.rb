Deface::Override.new(
  virtual_path: 'spree/orders/_line_item',
  name: 'line_item_add_ons',
  insert_bottom: '[data-hook="cart_item_description"]',
  partial: 'spree/add_ons/line_item',
  original: 'ce2b7ddab2a6a13b25159ea18f6ab50991409d3e',
  disabled: false
)
