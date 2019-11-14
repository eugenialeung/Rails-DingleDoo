class Product < ApplicationRecord
    validates :name, :sku, presence: true, uniqueness: true
    validates :price, presence: true, format: { with: /\A\d+(?:\.\d{2})?\z/ }, numericality: { greater_than: 0, less_than: 1000000 }

end


