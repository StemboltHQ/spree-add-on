class Spree::LineItemAddOn < ActiveRecord::Base
  belongs_to :add_on
  belongs_to :line_item
end
