class Product < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :sku, uniqueness: true
    validates :description, presence: true
    validates :price, presence: true


end


