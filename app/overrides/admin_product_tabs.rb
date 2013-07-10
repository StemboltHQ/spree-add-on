Deface::Override.new(
  virtual_path: 'spree/admin/shared/_product_tabs',
  name: 'admin_product_tabs',
  insert_bottom: '[data-hook="admin_product_tabs"]',
  partial: 'spree/admin/shared/add_on_product_tab',
  disabled: false
)
