class Spree::AddOn < ActiveRecord::Base
  attr_accessible :description, :name, :type
  belongs_to :product, class_name: 'Spree::Product'

  has_one :default_price,
    class_name: 'Spree::AddOnPrice',
    conditions: {currency: Spree::Config[:currency]},
    dependent: :destroy
  delegate_belongs_to :default_price, :display_amount, :price=, :currency

  has_many :prices,
    class_name: 'Spree::AddOnPrice',
    dependent: :destroy

  def price_in(currency)
    prices.where(currency: currency).first || self.build_default_price(currency: currency)
  end

  def self.types
    Rails.application.config.spree.add_ons
  end

  def self.description
    self.human_attribute_name(:type_description)
  end
end
