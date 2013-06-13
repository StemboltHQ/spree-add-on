module Spree
  Product.class_eval do
    has_many :add_ons, dependent: :destroy
  end
end
