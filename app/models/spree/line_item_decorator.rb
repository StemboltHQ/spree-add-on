require 'durable_decorator'

module Spree
  LineItem.class_eval do
    has_many :line_item_add_ons, dependent: :destroy
    has_many :add_ons, through: :line_item_add_ons

    attr_accessible :add_on_ids

    meta = {
      mode: 'strict',
      sha: '7b3df3d93294ddec78f32d1c4110d87aad7afb39'
    }

    durably_decorate :amount, meta do
      (price + add_on_amount) * quantity
    end

    private
    def add_on_amount
      add_ons.map do |add_on|
        add_on.price_in(currency).amount || 0
      end.reduce(0, :+)
    end
  end
end
