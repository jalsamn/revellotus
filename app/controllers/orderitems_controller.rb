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
  
  def poorinventory
         @itemsperday = Groupedtotal
          .select("name, SUM(totalsold) as totalsold, rinventors.theoretical_ending_inventory as inventoryonhand")
          .where(created_date: params[:start_date]..params[:end_date])
          .having('SUM(totalsold) < ?', params[:msold])
          .joins('LEFT OUTER JOIN rinventors ON rinventors.rproductid = productid')
          .group("name, rinventors.theoretical_ending_inventory")
          .having('rinventors.theoretical_ending_inventory > ?', params[:minventory])
          .sort_by(&:inventoryonhand).reverse
    
    @paginatable_array = Kaminari.paginate_array(@itemsperday).page(params[:page]).per(20)
  end
  
  def poorinventorydate
    if params[:start_date] && params[:end_date]
      end_params = params[:end_date]
      start_params = params[:start_date]
      start_date = DateTime.new(start_params["year"].to_i, start_params["month"].to_i, start_params["day"].to_i)
      end_date = DateTime.new(end_params["year"].to_i, end_params["month"].to_i, end_params["day"].to_i)
      msold = params[:maxsold]
      minventory = params[:mininventory]
    
      redirect_to :action => 'poorinventory', :start_date => start_date, :end_date => end_date, :msold => msold, :minventory => minventory
    end
  end
  
  def salesforproducedatebreakdown
    if params[:start_date] && params[:end_date]
      end_params = params[:end_date]
      start_params = params[:start_date]
      start_date = DateTime.new(start_params["year"].to_i, start_params["month"].to_i, start_params["day"].to_i)
      end_date = DateTime.new(end_params["year"].to_i, end_params["month"].to_i, end_params["day"].to_i)
    
      redirect_to :action => 'salesforproducebreakdown', :start_date => start_date, :end_date => end_date, :email => params[:email]
    end
  end
 
  def salesforproducebreakdown  
    ReportingMailer.delay.custom_produce_sales_email(params[:start_date], params[:end_date], params[:email])      
  end
  
  
  def salesforproducedatephx
    if params[:start_date] && params[:end_date]
      end_params = params[:end_date]
      start_params = params[:start_date]
      start_date = DateTime.new(start_params["year"].to_i, start_params["month"].to_i, start_params["day"].to_i)
      end_date = DateTime.new(end_params["year"].to_i, end_params["month"].to_i, end_params["day"].to_i)
    
      redirect_to :action => 'salesforproducephx', :start_date => start_date, :end_date => end_date
    end
  end
 
  def salesforproducephx
        ReportingMailer.delay.custom_produce_sales_email(params[:start_date], params[:end_date], '/products/ProductCategory/539/')
  end  
  
    def salesforproducedateall
    if params[:start_date] && params[:end_date]
      end_params = params[:end_date]
      start_params = params[:start_date]
      start_date = DateTime.new(start_params["year"].to_i, start_params["month"].to_i, start_params["day"].to_i)
      end_date = DateTime.new(end_params["year"].to_i, end_params["month"].to_i, end_params["day"].to_i)
    
      redirect_to :action => 'salesforproduceall', :start_date => start_date, :end_date => end_date
    end
  end
 
  def salesforproduceall
    @itemsperday = Groupedtotal
    .select("name, SUM(totalsold) as totalsold")
      .where(created_date: params[:start_date]..params[:end_date]) 
      .where(:category => ['/products/ProductCategory/539/', '/products/ProductCategory/120/'] )
      .group("name, category")
    .sort_by(&:name)
        
    @paginatable_array = Kaminari.paginate_array(@itemsperday).page(params[:page]).per(20)
  end  
  
  
############# REVENUE BASED REPORT ######################
  def totalrevenuesalesdateall
    if params[:start_date] && params[:end_date]
      end_params = params[:end_date]
      start_params = params[:start_date]
      start_date = DateTime.new(start_params["year"].to_i, start_params["month"].to_i, start_params["day"].to_i)
      end_date = DateTime.new(end_params["year"].to_i, end_params["month"].to_i, end_params["day"].to_i)
    
      redirect_to :action => 'totalrevenuesalesall', :start_date => start_date, :end_date => end_date
    end
  end
 
  def totalrevenuesalesall
    @itemsperday = Groupedincometotal
    .select("name, SUM(itemrevenue) as totalsold")
    .where(created_date: params[:start_date]..params[:end_date]) 
    .group("name")
    .sort_by(&:totalsold).reverse
    
    @paginatable_array = Kaminari.paginate_array(@itemsperday).page(params[:page]).per(20)
  end
  
  def revenueforproducedateall
    if params[:start_date] && params[:end_date]
      end_params = params[:end_date]
      start_params = params[:start_date]
      start_date = DateTime.new(start_params["year"].to_i, start_params["month"].to_i, start_params["day"].to_i)
      end_date = DateTime.new(end_params["year"].to_i, end_params["month"].to_i, end_params["day"].to_i)
    
      redirect_to :action => 'revenueforproduceall', :start_date => start_date, :end_date => end_date
    end
  end
 
  def revenueforproduceall
    @itemsperday = Groupedincometotal
    .select("name, SUM(itemrevenue) as totalsold")
      .where(created_date: params[:start_date]..params[:end_date]) 
      .where(:category => ['/products/ProductCategory/539/', '/products/ProductCategory/120/'] )
      .group("name, category")
    .sort_by(&:name)
        
   # @paginatable_array = Kaminari.paginate_array(@itemsperday).page(params[:page]).per(20)
  end  
  
#####################################################################################################
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
