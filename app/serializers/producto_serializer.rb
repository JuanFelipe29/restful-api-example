class ProductoSerializer < ActiveModel::Serializer
  attributes :id, :nombre, :descripcion, :precio
end
