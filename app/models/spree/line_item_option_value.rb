class Spree::LineItemOptionValue < ActiveRecord::Base
  belongs_to :line_item
  belongs_to :option_value
end
