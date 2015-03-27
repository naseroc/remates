class BetsController < ApplicationController
	def new
		@product = Product.find(params[:product_id])
		@product.price = @product.price + 500
		Bet.create(product:@product, user:current_user)
		redirect_to root_path, notice: 'Has aumentado la apuesta del producto.'
		end
	end
	def destroy
	end
end
