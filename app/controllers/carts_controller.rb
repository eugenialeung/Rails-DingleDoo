class CartsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
    before_action :set_cart, only: [:show]


    
    def show
        # @cart = Cart.find(params[:id])
        render :show
    end

    def destroy
        @cart = Cart.find(session[:cart_id])
        @cart.destroy if @cart.id == session[:cart_id]
        session[:cart_id] = nil
        redirect_to root_url
    end


  
    private
    def invalid_cart
        logger.error "Attempt to access invalid cart #{params[:id]}"
        redirect_to root_url, notics: "That cart doesn't exist!"
    end

end

