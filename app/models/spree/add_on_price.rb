module Spree
  class AddOnPrice < ActiveRecord::Base
    belongs_to :add_on, class_name: 'Spree::AddOn'

    validates :add_on, presence: true
    validates :amount, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

    before_save :set_default_currency

    attr_accessible :currency, :amount

    def display_amount
      money
    end

    def money
      Spree::Money.new(amount || 0, { currency: currency })
    end

    def price=(price)
      self.amount = price
    end

    private
    def set_default_currency
      self.currency = Spree::Config[:currency] if self.currency.nil?
    end
  end
end
