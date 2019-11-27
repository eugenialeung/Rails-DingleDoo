class CartItemsController < ApplicationController

    before_action :set_cart, only: [:create, :update, :destroy]
    before_action :set_cart_item, only: [:update, :destroy]

    def create
        @cart.add_product(params)
        
        if @cart.save
          redirect_to cart_url(@cart)
        else
          redirect_to root_url
        end
    end

    def add_quantity
        @cart_item = CartItem.find(params[:id])
        @cart_item.quantity += 1
        @cart_item.save
        redirect_to cart_path(current_cart)
      end
      
      def reduce_quantity
        @cart_item = CartItem.find(params[:id])
        if @cart_item.quantity > 1
          @cart_item.quantity -= 1
        end
        @cart_item.save
        redirect_to cart_path(current_cart)
      end



    

    
      def destroy
        @cart_item.destroy
        redirect_to cart_url(@cart)
      end
    
      private
        def current_cart 
          @current_cart = Cart.find(session[:cart_id])
        end
        
        def set_cart_item
          @cart_item = CartItem.find(params[:id])
        end
    
        def cart_item_params
          params.require(:cart_item).permit(:product_id, :cart_id, :quantity)
        end

  


end

