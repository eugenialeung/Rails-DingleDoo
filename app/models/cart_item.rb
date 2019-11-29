class CartItem < ApplicationRecord
    belongs_to :product, dependent: :destroy
    belongs_to :cart


    def product_total_price
        quantity.to_i * product.price.to_i
    end 

end
