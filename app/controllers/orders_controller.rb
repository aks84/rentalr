class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  def index
    @orders = Order.all
  end

  def show
  end


  def new
    @order = Order.new
    @order.user_id = current_user.id
    @product = Product.find(params[:product_id])
        
  end

  # GET /orders/1/edit
  def edit
  end


  def create
    @order = Order.new(order_params)
    @product = Product.find(params[:product_id])
    @order.product_id = @product.id
    @order.buyer_id = current_user.id
    @order.seller_id = current_user.id
    @order.user_id = current_user.id
    

    respond_to do |format|
      if @order.save
        format.html { redirect_to root_path, notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:address, :city, :state, :user_id, :product_id)
    end
end
