require 'durable_decorator'

module Spree
  LineItem.class_eval do
    has_many :line_item_add_ons, dependent: :destroy
    has_many :add_ons, through: :line_item_add_ons

    after_create :add_default_add_ons
    attr_accessible :add_on_ids

    meta = {
      mode: 'strict',
      sha: '7b3df3d93294ddec78f32d1c4110d87aad7afb39'
    }

    durably_decorate :amount, meta do
      (price + add_on_amount) * quantity
    end

    def price_with_add_ons_unchanged?
      single_money_with_add_ons == single_money
    end

    def single_money_with_add_ons
      Spree::Money.new(price + add_on_amount, currency: order.currency)
    end

    def name
      read_attribute(:name) || variant.name
    end

    def description
      read_attribute(:description) || variant.description
    end

    private
    def add_on_amount
      line_item_add_ons.map do |line_item_add_on|
        line_item_add_on.price || 0
      end.reduce(0, :+)
    end

    def add_default_add_ons
      self.add_ons << self.product.add_ons.default
    end
  end
end
