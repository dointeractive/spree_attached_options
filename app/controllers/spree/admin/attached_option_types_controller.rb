module Spree
  class Admin::AttachedOptionTypesController < Admin::ResourceController
    def index
      @attached_option_types = AttachedOptionType.all
      @product = Product.find_by_permalink!(params[:product_id])
      @option_types = OptionType.all
    end
  end
end
