class Spree::AttachedOptionType < ActiveRecord::Base
  belongs_to :product
  belongs_to :option_type
  delegate 'name', to: :option_type
  delegate 'presentation', to: :option_type
  attr_accessible :product, :option_type
end
