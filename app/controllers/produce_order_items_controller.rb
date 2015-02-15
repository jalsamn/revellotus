class ProduceOrderItemsController < ApplicationController
  before_action :set_produce_order_item, only: [:show, :edit, :update, :destroy]

  # GET /produce_order_items
  # GET /produce_order_items.json
  def index
    @produce_order_items = ProduceOrderItem.all
  end

  # GET /produce_order_items/1
  # GET /produce_order_items/1.json
  def show
  end

  # GET /produce_order_items/new
  def new
    @produce_order_item = ProduceOrderItem.new
  end

  # GET /produce_order_items/1/edit
  def edit
  end

  # POST /produce_order_items
  # POST /produce_order_items.json
  def create
    @produce_order_item = ProduceOrderItem.new(produce_order_item_params)

    respond_to do |format|
      if @produce_order_item.save
        format.html { redirect_to @produce_order_item, notice: 'Produce order item was successfully created.' }
        format.json { render :show, status: :created, location: @produce_order_item }
      else
        format.html { render :new }
        format.json { render json: @produce_order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /produce_order_items/1
  # PATCH/PUT /produce_order_items/1.json
  def update
    respond_to do |format|
      if @produce_order_item.update(produce_order_item_params)
        format.html { redirect_to @produce_order_item, notice: 'Produce order item was successfully updated.' }
        format.json { render :show, status: :ok, location: @produce_order_item }
      else
        format.html { render :edit }
        format.json { render json: @produce_order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produce_order_items/1
  # DELETE /produce_order_items/1.json
  def destroy
    @produce_order_item.destroy
    respond_to do |format|
      format.html { redirect_to produce_order_items_url, notice: 'Produce order item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produce_order_item
      @produce_order_item = ProduceOrderItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def produce_order_item_params
      params.require(:produce_order_item).permit(:producename, :quantity, :order_id)
    end
end
