class ProduceOrdersController < ApplicationController
  before_action :set_produce_order, only: [:show, :edit, :update, :destroy]

  # GET /produce_orders
  # GET /produce_orders.json
  def index
    @produce_orders = ProduceOrder.all
  end

  # GET /produce_orders/1
  # GET /produce_orders/1.json
  def show
  end

  # GET /produce_orders/new
  def new
    @produce_order = ProduceOrder.new
    @producenum = Product.where(category: '/products/ProductCategory/120/').count
    @allproduce = Product.where(category: '/products/ProductCategory/120/')
    
    
    @producenum.times {@produce_order.produce_order_items.build}
  end

  # GET /produce_orders/1/edit
  def edit
  end

  # POST /produce_orders
  # POST /produce_orders.json
  def create
    @produce_order = ProduceOrder.new(produce_order_params)
    respond_to do |format|
      if @produce_order.save
        #ProduceOrderMailer.send_simple_message.deliver
        ProduceOrderMailer.produce_order_email(@produce_order).deliver
        format.html { redirect_to @produce_order, notice: 'Produce order was successfully created.' }
        format.json { render :show, status: :created, location: @produce_order }
      else
        format.html { render :new }
        format.json { render json: @produce_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /produce_orders/1
  # PATCH/PUT /produce_orders/1.json
  def update
    respond_to do |format|
      if @produce_order.update(produce_order_params)
        format.html { redirect_to @produce_order, notice: 'Produce order was successfully updated.' }
        format.json { render :show, status: :ok, location: @produce_order }
      else
        format.html { render :edit }
        format.json { render json: @produce_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produce_orders/1
  # DELETE /produce_orders/1.json
  def destroy
    @produce_order.destroy
    respond_to do |format|
      format.html { redirect_to produce_orders_url, notice: 'Produce order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produce_order
      @produce_order = ProduceOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def produce_order_params
     params.require(:produce_order).permit(:vendor, :orderdate, produce_order_items_attr: [:id, :producename, :quantity, :instock, :remark])
    end
end
