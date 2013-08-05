Spree::LineItem.class_eval do
  has_many :line_item_option_values
  has_many :option_values, through: :line_item_option_values

  attr_accessible :option_values
end
