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
      expect(page).to have_content 'Backup CD'
      expect(find('#subtotal .order-total').text).to eq '$19.99'
      expect(find('#order_line_items_attributes_0_add_on_ids_1')).not_to be_checked

      page.check 'order_line_items_attributes_0_add_on_ids_1'
      click_button 'update-button'

      expect(find('#order_line_items_attributes_0_add_on_ids_1')).to be_checked
      expect(find('#subtotal .order-total').text).to eq '$24.98'
    end

    context 'with a default add-on' do
      given!(:add_on) { create :add_on, name: 'Backup CD', product: product, price: 4.99, default: true, expiration_days: 5 }

      scenario 'add-on is selected by default' do
        expect(page).to have_content 'Backup CD (Expires in 5 days)'
        expect(find('#subtotal .order-total').text).to eq '$24.98'
        expect(find('#order_line_items_attributes_0_add_on_ids_1')).to be_checked
      end
    end

  end
end
