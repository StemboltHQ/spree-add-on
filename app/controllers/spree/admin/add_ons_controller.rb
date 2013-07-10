module Spree
  module Admin
    class AddOnsController < ResourceController
      belongs_to 'spree/product', find_by: :permalink

      def index
        @add_ons = @product.add_ons
        respond_with(@add_ons)
      end
    end
  end
end
