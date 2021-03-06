class ProductsController < ApplicationController
before_action :authenticate_user!
  def index
  	@prod = Product.where(available: true)
  	@prod.each do |p|
  		if (p.created_at + p.additionaltime - Time.now).to_i <= 0
			p.available = false
			p.winner = p.bets.last.user.id
			p.save
  		end
  	end
  	@products = Product.where(available: true)
  end

  def closed
  	@prod = Product.where(available: true)
  	@prod.each do |p|
  		if (p.created_at + p.additionaltime - Time.now).to_i <= 0
			p.available = false
			p.winner = p.bets.last.user.id
			p.save
  		end
  	end
  	@products = Product.where(available: false)
  end



  def show
  	@product = Product.find(params[:id])
  	@caduca = caduca(@product)
  end


private
  def caduca(product)
  	seconds = product.created_at + product.additionaltime - Time.now
  	horas = ((seconds/3600).to_i)%24 
  	minutos = ((seconds/60).to_i)%60
  	return "#{horas} hora(s) y #{minutos} minuto(s)"
  end
end
