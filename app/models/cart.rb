class Cart < ApplicationRecord
    has_many :cart_items, dependent: :destroy
    # has_many :products, through: :cart_items



    def add_product(product_params)

        current_item = cart_items.find_by(product_id: product_params[:product][:product_id])
    
        if current_item
          current_item.quantity += product_params[:product][:quantity].to_i
          current_item.save
        else
          new_item = cart_items.create(product_id: product_params[:product][:product_id], 
                                      quantity: product_params[:product][:quantity],
                                      cart_id: self.id)
        end
          new_item
  
    end

    def cart_subtotal
      cart_items.to_a.sum { |item| item.product_total_price}
    end




end
