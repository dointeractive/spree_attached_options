module Spree
  class Admin::AttachedOptionTypesController < Admin::ResourceController
    belongs_to 'spree/product', :find_by => :permalink
    new_action.before :before_new

    # @parent is a @product
    def create
      option_type_ids = params[:product][:option_types] 
      option_types = Spree::OptionType.where(id: option_type_ids)      
      option_types.each do |option_type|  
        @parent.attached_option_types.create(option_type: option_type)
      end
      redirect_to collection_url
    end

    private
      def before_new
        @attached_option_type = AttachedOptionType.new
        @option_types = OptionType.all - @parent.attached_option_types.map(&:option_type)
      end
  end
end
