Spree::Variant.class_eval do
  has_many :attached_options
  accepts_nested_attributes_for :attached_options
end
