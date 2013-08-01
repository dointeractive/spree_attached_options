class Spree::AttachedOptionType < ActiveRecord::Base
  belongs_to :product
  belongs_to :option_type
  # attr_accessible :title, :body
end
