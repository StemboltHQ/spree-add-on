class Spree::AddOn < ActiveRecord::Base
  attr_accessible :description, :name

  has_one :default_price,
    class_name: 'Spree::AddOnPrice',
    conditions: {currency: Spree::Config[:currency]},
    dependent: :destroy

  has_many :prices,
    class_name: 'Spree::AddOnPrice',
    dependent: :destroy

  def self.types
    Rails.application.config.spree.add_ons.send(self.to_s.tableize.gsub('/', '_').sub('spree_', ''))
  end

  def self.description
    self.human_attribute_name(:type_description)
  end
end
