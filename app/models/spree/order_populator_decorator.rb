Spree::OrderPopulator.class_eval do
  def populate(from_hash)
    from_hash[:products].each do |product_id, attrs|
      attempt_cart_add(attrs[:variant_id], from_hash[:quantity])
    end
    valid?
  end
end
