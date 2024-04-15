class OrdenSerializer < ActiveModel::Serializer
  attributes :id, :estado, :total, :productos

  def productos
    object.orden_productos.map do |orden_producto|
      producto = orden_producto.producto
      {
        id: producto.id,
        nombre: producto.nombre,
        descripcion: producto.descripcion,
        precio: producto.precio,
        cantidad: orden_producto.cantidad
      }
    end
  end
  
end
