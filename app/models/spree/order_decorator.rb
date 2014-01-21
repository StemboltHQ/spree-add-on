Spree::Order.class_eval do
  has_many :add_ons, through: :line_items
end
