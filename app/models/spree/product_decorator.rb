Spree::Product.class_eval do
  delegate :attached_options, to: :master, prefix: true
  has_many :attached_option_types

  def group_attached_options_by_option_type
    master_attached_options.group_by{ |a| a.option_value.option_type }
  end
end
