class ProductsController < ApplicationController
    before_action :require_user!

    def index
        @products = Product.all
        render :index
    end

    def show
        @product = Product.find(params[:id])
        render :show
    end

    def new
        @product = Product.new
        render :new
    end

    def create
        @product = Product.new(product_params)
        if @product.save
            redirect_to product_url(@product)
        else
            flash.now[:errors] = @product.errors.full_messages
            render :new
        end
    end

    def edit
        @product = Product.find(params[:id])
        render :edit
    end
    
    def update
        @product = Product.find(params[:id])
        if @product.update(product_params)
            redirect_to product_url(@product)
        else
            flash.now[:errors] = @product.errors.full_messages
            render :edit
        end
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to products_url
    end

    private

    def product_params
        params.require(:product).permit(:name, :price, :color, :style, :sku)
    end
end
