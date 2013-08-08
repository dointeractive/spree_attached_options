Spree::LineItem.class_eval do
  has_many :line_item_option_values
  has_many :option_values, through: :line_item_option_values
  attr_accessible :option_values

  def self.find_mathching(line_item)
    if line_item.option_values.any?
      self.find_by_variant_id_and_option_value_ids(line_item.variant_id, line_item.option_value_ids)
    else
      self.find_by_variant_id(line_item.variant_id)
    end
  end

  def self.find_by_variant_id_and_option_value_ids(variant_id, option_value_ids)
    joins(:option_values)
    .where(:variant_id => variant_id, :'spree_option_values.id' => option_value_ids)
    .group('spree_line_items.id')
    .having('count(distinct spree_option_values.id) = ?', option_value_ids.size)
    .readonly(false)
    .first
  end

  def options_text
    values = self.option_values.includes(:option_type)
    values.map!{ |v| "#{v.option_type.presentation}: #{v.presentation}" }
    values.to_sentence(words_connector: ', ', two_words_connector: ', ')
  end
end
