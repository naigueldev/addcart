class CartshipsController < ApplicationController
  before_action :set_cartship, only: [:show, :edit, :update, :destroy]

  # GET /cartships
  # GET /cartships.json
  def index
    @cartships = Cartship.all
  end

  # GET /cartships/1
  # GET /cartships/1.json
  def show
  end

  # GET /cartships/new
  def new
    @cartship = Cartship.new
  end

  # GET /cartships/1/edit
  def edit
  end

  # POST /cartships
  # POST /cartships.json
  def create
    @cartship = Cartship.new(cartship_params)
    
    respond_to do |format|
      if @cartship.save
        format.html { redirect_to @cartship, notice: 'Cartship criado com sucesso.' }
        format.json { render :show, status: :created, location: @cartship }
      else
        format.html { render :new }
        format.json { render json: @cartship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cartships/1
  # PATCH/PUT /cartships/1.json
  def update
    cart = Cart.find(session[:cart_id])
    respond_to do |format|
      if @cartship.update(cartship_params)
        format.html { redirect_to cart, notice: 'Cartship atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @cartship }
      else
        format.html { render :edit }
        format.json { render json: @cartship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cartships/1
  # DELETE /cartships/1.json
  def destroy
    @cartship.destroy
    cart = Cart.find(session[:cart_id])
    respond_to do |format|
      format.html { redirect_to cart, notice: 'Cartship deletado com sucesso.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cartship
      @cartship = Cartship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cartship_params
      params.require(:cartship).permit(:cart_id, :product_id, :quantity)
    end
end
