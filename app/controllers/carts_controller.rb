class CartsController < ApplicationController
    before_action :set_cart, only: [:index]


    
    def show
        @cart = Cart.find(params[:id])
        render :show
    end

  
end

