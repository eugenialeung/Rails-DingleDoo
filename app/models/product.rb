class Product < ApplicationRecord
    # before_destroy :not_referenced_by_any_cart_item
    validates :name, presence: true, uniqueness: true
    validates :sku, uniqueness: true
    validates :description, presence: true
    validates :price, presence: true

    has_one_attached :images

    has_many :cart_items
    has_many :carts, through: :cart_items


    private 

    # def not_referenced_by_any_cart_item
    #     unless cart_items.empty?
    #         throw :abort
    #     end
    # end


end


