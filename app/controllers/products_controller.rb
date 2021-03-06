class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_url, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to products_url, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def checkout
    @product = Product.find(params[:id])
  end

  def buy
    @product = Product.find(params[:id])
    @product.buy

    redirect_to @product
  end

  def add_to_cart


    if session[:cart_id].blank?
      cart = Cart.create(status: "pending")
      session[:cart_id] = cart.id
    else
      # cart exist ok
      cart = Cart.find(session[:cart_id])
    end

    product = Product.find(params[:id])
    cartship = cart.cartships.where('product_id = ?', product.id).first
    if cartship
      cartship.update_attributes(:quantity => cartship.add_item )
      # cartship.add_item(product, cart)
      redirect_to products_url, notice: 'Produto já está no carrinho. Adicionamos mais um na quandiade.';
    else
      product = Product.find(params[:id])
      cart.cartships.create(product_id: product.id, quantity: 1)
      redirect_to cart
    end
    cart = Cart.find(session[:cart_id])
    # redirect_to cart
    # redirect_to products_url
  end

  def current_cart
    if session[:cart_id]
      @current_cart = Cart.find(session[:cart_id])
    end
    if session[:cart_id].blank?
      @current_cart = Cart.create(status: "pending")
      session[:cart_id] = @current_cart.id
    end
    @current_cart
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price, :image_url, :stock)
    end
end
