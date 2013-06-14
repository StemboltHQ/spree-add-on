class Spree::LineItemAddOn < ActiveRecord::Base
  belongs_to :add_on, dependent: :destroy
  belongs_to :line_item, dependent: :destroy
end
