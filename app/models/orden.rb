class Orden < ApplicationRecord
    has_many :orden_productos, dependent: :destroy
    has_many :productos, through: :orden_productos

    def agregar_producto(producto, cantidad)
        if cantidad.positive?
          orden_productos.create(producto: producto, cantidad: cantidad)
        end
    end
    
end
