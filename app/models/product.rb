class Product < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :sku, uniqueness: true
    validates :description, presence: true
    validates :price, presence: true

    has_one_attached :images

    has_many :cart_items
    has_many :carts, through: :cart_items


end


