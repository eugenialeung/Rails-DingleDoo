class DingledooController < ApplicationController

    def index
        render :index
    end

    def shop
        @products = Product.all
        render :shop
    end

    def show
        @product = Product.find(params[:id])
        render :show
    end


end
