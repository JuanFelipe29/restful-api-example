class Producto < ApplicationRecord
    has_many :orden_productos, dependent: :destroy
    has_many :ordens, through: :orden_productos
end
