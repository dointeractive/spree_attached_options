module Spree
  module Admin
    module AttachedOptionsHelper
      def show_attached_options?
        @product.master_attached_options.any?
      end
    end
  end
end
