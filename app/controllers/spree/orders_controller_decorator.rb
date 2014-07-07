Spree::OrdersController.class_eval do
  before_action :populate_order, only: :populate

  private

  def populate_order
    populator = Spree::OrderPopulator.new(current_order(create_order_if_necessary: true), current_currency)

    unless populator.populate(populate_params)
      flash[:error] = populator.errors.full_messages.join(" ")
      redirect_to :back
    end

    params.delete :attached_options_ids
    params.delete :variant_id
    params.delete :quantity
  end

  def populate_params
    params.permit(:variant_id, :quantity, attached_options_ids: [])
  end
end
