module Spree
  class AddOnPrice < ActiveRecord::Base
    belongs_to :add_on, class_name: 'Spree::AddOn'

    validates :amount, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

    attr_accessible :add_on_id, :currency, :amount

    def display_amount
      money
    end

    def money
      Spree::Money.new(amount || 0, { currency: currency })
    end
  end
end
