class Api::V1::OrdenesController < ApplicationController
  before_action :set_orden, only: [:show, :update, :destroy]

  # GET /api/ordenes
  def index
    ordenes = Orden.all
    render json: ordenes, each_serializer: OrdenSerializer

  end

  # GET /api/ordenes/:id
  def show
    render json: @orden, serializer: OrdenSerializer
  end

    # POST /api/v1/ordenes
    def create
      # Crea una nueva instancia de Orden con los parámetros recibidos
      orden = Orden.new(orden_params)
  
      # Intenta guardar la orden en la base de datos
      if orden.save
        # Si la orden se guarda exitosamente, procede a asociar los productos
        productos_params = params[:productos]
  
        productos_params.each do |producto_id, cantidad|
          producto = Producto.find(producto_id)
          orden.agregar_producto(producto, cantidad.to_i)
        end
  
        # Si los productos se asocian correctamente, responde con la orden creada
        render json: orden, status: :created, serializer: OrdenSerializer
      else
        # Si la orden no se pudo guardar, responde con los errores de validación
        render json: orden.errors, status: :unprocessable_entity
      end
    end

  # PATCH/PUT /api/ordenes/:id
  def update
    if @orden.update(orden_params)
      render json: @orden, serializer: OrdenSerializer
    else
      render json: @orden.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/ordenes/:id
  def destroy
    @orden.destroy
    head :no_content
  end

  private

  def set_orden
    @orden = Orden.find(params[:id])
  end

  def orden_params
    params.require(:orden).permit(:estado, :total)
  end
end
