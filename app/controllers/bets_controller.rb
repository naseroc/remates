class BetsController < ApplicationController
before_action :authenticate_user!

	def new
		@product = Product.find(params[:product_id])
		if @product.bets.last == nil or @product.bets.last.user != current_user
			@product.price = @product.price + 500
			@product.additionaltime = @product.additionaltime + 300

			@product.save

			 # Está en segundos y su valor por defecto es 2.hours 
			Bet.create(product:@product, user:current_user)
			
			redirect_to root_path, notice: "Has rematado al producto #{@product.name}"
		else
			redirect_to products_path, alert: "No puedes rematar 2 veces seguidas al producto #{@product.name}."
		end
	end

	def destroy
	end

	def mybets
		@bets = current_user.bets
	end

private
  def caduca(product)
  	seconds = product.created_at + product.additionaltime - Time.now
  	horas = ((seconds/3600).to_i)%24 
  	minutos = ((seconds/60).to_i)%60
  	return "#{horas} hora(s) y #{minutos} minuto(s)"
  end
end
