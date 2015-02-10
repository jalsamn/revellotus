class RevInventoriesController < ApplicationController
  before_action :set_rev_inventory, only: [:show, :edit, :update, :destroy]

  # GET /rev_inventories
  # GET /rev_inventories.json
  def index
    @rev_inventories = RevInventory.all
  end

  # GET /rev_inventories/1
  # GET /rev_inventories/1.json
  def show
  end

  # GET /rev_inventories/new
  def new
    @rev_inventory = RevInventory.new
  end

  # GET /rev_inventories/1/edit
  def edit
  end

  # POST /rev_inventories
  # POST /rev_inventories.json
  def create
    @rev_inventory = RevInventory.new(rev_inventory_params)

    respond_to do |format|
      if @rev_inventory.save
        format.html { redirect_to @rev_inventory, notice: 'Rev inventory was successfully created.' }
        format.json { render :show, status: :created, location: @rev_inventory }
      else
        format.html { render :new }
        format.json { render json: @rev_inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rev_inventories/1
  # PATCH/PUT /rev_inventories/1.json
  def update
    respond_to do |format|
      if @rev_inventory.update(rev_inventory_params)
        format.html { redirect_to @rev_inventory, notice: 'Rev inventory was successfully updated.' }
        format.json { render :show, status: :ok, location: @rev_inventory }
      else
        format.html { render :edit }
        format.json { render json: @rev_inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rev_inventories/1
  # DELETE /rev_inventories/1.json
  def destroy
    @rev_inventory.destroy
    respond_to do |format|
      format.html { redirect_to rev_inventories_url, notice: 'Rev inventory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rev_inventory
      @rev_inventory = RevInventory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rev_inventory_params
      params.require(:rev_inventory).permit(:update_date, :product, :starting_amount, :added_amount, :threshold, :sold_amount, :actual_amount, :theoretical_ending_inventory)
    end
end
