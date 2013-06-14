require 'spec_helper'

feature 'Shopping Cart' do
  background do
    Spree::Product.delete_all
  end

  context 'when in the shopping cart' do
    given!(:product) { create :product, name: 'Starcraft', price: 19.99 }
    given!(:add_on) { create :add_on, name: 'Backup CD', product: product, price: 4.99 }

    background do
      visit spree.products_path
      click_link 'Starcraft'
      click_button 'add-to-cart-button'
    end

    scenario 'product has add_on checkboxes' do
      page.should have_content 'Backup CD'
      find('#subtotal .order-total').text.should eq '$19.99'
      find('#order_line_items_attributes_0_add_on_ids_1').should_not be_checked

      page.check 'order_line_items_attributes_0_add_on_ids_1'
      click_button 'update-button'

      find('#order_line_items_attributes_0_add_on_ids_1').should be_checked
      find('#subtotal .order-total').text.should eq '$24.98'
    end
  end
end
