Spree::OrdersController.class_eval do
	def show
		@order = Spree::Order.find_by_number!(params[:id])
		@delivery = []
		@order.shipments.each do |shipment|
			if shipment.seur_label
				expeditions = shipment.seur_label.generate_expedition('consulta_listado_expediciones_str')	
				expeditions.expediciones.expedicion.each do |exp|
					if exp.remite_ref.text.upcase == shipment.number
						@delivery << exp
					end
				end
			end
		end	
	end
end