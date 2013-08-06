Spree::LineItem.class_eval do
  has_many :line_item_option_values
  has_many :option_values, through: :line_item_option_values
  attr_accessible :option_values

  def options_text
    values = self.option_values.includes(:option_type)
    values.map!{ |v| "#{v.option_type.presentation}: #{v.presentation}" }
    values.to_sentence(words_connector: ', ', two_words_connector: ', ')
  end
end
