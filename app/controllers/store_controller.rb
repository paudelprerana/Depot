class StoreController < ApplicationController
  def index
  	@products = Product.order(:title)
  	increment_count
  	@cart = current_cart
end

 def increment_count
 	if session[:counter].nil?
 		session[:counter] = 0
 	end
 	session[:counter] +=1
 end

end
