class Spree::AttachedOption < ActiveRecord::Base
  belongs_to :variant
  belongs_to :option_value

  default_scope { includes(option_value: :option_type) }

  def name
    option_value.option_type.name
  end

  def value
    option_value.name
  end

end
