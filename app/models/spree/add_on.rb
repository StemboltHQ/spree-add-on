class Spree::AddOn < ActiveRecord::Base
  attr_accessible :description, :name

  def self.types
    Rails.application.config.spree.add_ons.send(self.to_s.tableize.gsub('/', '_').sub('spree_', ''))
  end

  def self.description
    self.human_attribute_name(:type_description)
  end
end
