class OrderitemsController < ApplicationController
  before_action :set_orderitem, only: [:show, :edit, :update, :destroy]
  # GET /orderitems
  # GET /orderitems.json
  def index
    
    @itemsperday = Groupedtotal
    .select("name, SUM(totalsold) as totalsold")
    .where(created_date: params[:start_date]..params[:end_date])
    .group("name")
    .sort_by(&:totalsold).reverse
    
    @paginatable_array = Kaminari.paginate_array(@itemsperday).page(params[:page]).per(20)
    
  end
  
  def totalsales
    if params[:start_date] && params[:end_date]
    end_params = params[:end_date]
      start_params = params[:start_date]
      start_date = DateTime.new(start_params["year"].to_i, start_params["month"].to_i, start_params["day"].to_i)
      end_date = DateTime.new(end_params["year"].to_i, end_params["month"].to_i, end_params["day"].to_i)
    
      redirect_to :action => 'index', :start_date => start_date, :end_date => end_date
    end
  end
  
  def daterangepicker
  end

  # GET /orderitems/1
  # GET /orderitems/1.json
  def show
  end

  # GET /orderitems/new
  def new
    @orderitem = Orderitem.new
  end

  # GET /orderitems/1/edit
  def edit
  end

  # POST /orderitems
  # POST /orderitems.json
  def create
    @orderitem = Orderitem.new(orderitem_params)

    respond_to do |format|
      if @orderitem.save
        format.html { redirect_to @orderitem, notice: 'Orderitem was successfully created.' }
        format.json { render :show, status: :created, location: @orderitem }
      else
        format.html { render :new }
        format.json { render json: @orderitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orderitems/1
  # PATCH/PUT /orderitems/1.json
  def update
    respond_to do |format|
      if @orderitem.update(orderitem_params)
        format.html { redirect_to @orderitem, notice: 'Orderitem was successfully updated.' }
        format.json { render :show, status: :ok, location: @orderitem }
      else
        format.html { render :edit }
        format.json { render json: @orderitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orderitems/1
  # DELETE /orderitems/1.json
  def destroy
    @orderitem.destroy
    respond_to do |format|
      format.html { redirect_to orderitems_url, notice: 'Orderitem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orderitem
      @orderitem = Orderitem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def orderitem_params
      params.require(:orderitem).permit(:cost, :created_by, :created_date, :rev_id, :order_local_id, :productid, :product_name_override, :initial_price, :price,             :pure_sales, :revquantity, :actualqty, :updated_date)
    end
  
end
