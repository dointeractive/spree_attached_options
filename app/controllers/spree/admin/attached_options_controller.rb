module Spree
  class Admin::AttachedOptionsController < Admin::BaseController
    before_filter :load_product, except: :destroy

    def create
      unless @product.master.update_attributes create_params
        flash[:error] = Spree.t :fail_to_create_attached_options
      end
      redirect_to admin_product_attached_options_path
    end

    def destroy
      @attached_option = Spree::AttachedOption.find params[:id]
      @attached_option.destroy

      respond_with(@attached_option) do |format|
        format.html { redirect_to admin_product_attached_options_path }
        format.js   { render :partial => "spree/admin/shared/destroy" }
      end
    end

    private

    def create_params
      params.require(:master).permit(attached_options_attributes: [:option_value_id])
    end

    def load_product
      @product = Spree::Product
        .where(slug: params[:product_id])
        .includes(master: :attached_options)
        .first
    end
  end
end
