Spree::Product.class_eval do
  delegate :attached_options, to: :master, prefix: true
  has_many :attached_option_types
end
