class OrdenProducto < ApplicationRecord
  belongs_to :orden
  belongs_to :producto
end
