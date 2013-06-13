module Spree
  Product.class_eval do
    has_many :addons, dependent: :destroy
  end
end
