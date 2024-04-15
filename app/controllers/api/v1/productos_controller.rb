class Api::V1::ProductosController < ApplicationController
  before_action :set_producto, only: [:show, :update, :destroy]

  # GET /api/productos
  def index
    #productos = Producto.all
    #render json: productos, each_serializer: ProductoSerializer

     # Obtener productos paginados
     @productos = Producto.order(:nombre).page(params[:page]).per(params[:per_page] || 10)

     render json: {
        total_pages: @productos.total_pages,
        current_page: @productos.current_page,
        per_page: @productos.limit_value,
        productos: @productos
     }, each_serializer: ProductoSerializer
  end

  # GET /api/productos/:id
  def show
    render json: @producto, serializer: ProductoSerializer
  end

  # POST /api/productos
  def create
    producto = Producto.new(producto_params)

    if producto.save
      render json: producto, status: :created, serializer: ProductoSerializer
    else
      render json: producto.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/productos/:id
  def update
    if @producto.update(producto_params)
      render json: @producto, serializer: ProductoSerializer
    else
      render json: @producto.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/productos/:id
  def destroy
    @producto.destroy
    head :no_content
  end

  private

  def set_producto
    @producto = Producto.find(params[:id])
  end

  def producto_params
    params.require(:producto).permit(:nombre, :descripcion, :precio)
  end
end
