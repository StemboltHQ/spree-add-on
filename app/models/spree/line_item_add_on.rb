class Spree::LineItemAddOn < ActiveRecord::Base
  belongs_to :add_on
  belongs_to :line_item

  def expired?
    return false unless add_on.expiration_days

    (self.created_at + add_on.expiration_days.days).past?
  end
end
