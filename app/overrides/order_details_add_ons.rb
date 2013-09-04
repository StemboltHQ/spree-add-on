Deface::Override.new(
  virtual_path: 'spree/shared/_order_details',
  name: 'order_details_add_ons',
  insert_bottom: '[data-hook="order_item_description"]',
  partial: 'spree/add_ons/order_add_ons',
  disabled: false
)
