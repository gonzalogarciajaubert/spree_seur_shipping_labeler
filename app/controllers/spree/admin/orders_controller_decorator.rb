Spree::Admin::OrdersController.class_eval do
	include Expeditions
    def edit
    	can_not_transition_without_customer_info

        unless @order.completed?
          	@order.refresh_shipment_rates
		end
		@delivery = return_expeditions if has_seur_shipments?
	end
end