class TemplabelsController < ApplicationController
  layout 'templabel'
  before_action :set_templabel, only: [:show, :edit, :update, :destroy]

  @myvar = "class-level"
  
  # GET /templabels
  # GET /templabels.json
  def index
    @templabel = Templabel.new
    @templabels = Templabel.all
  end

  # GET /templabels/1
  # GET /templabels/1.json
  def show
  end

  # GET /templabels/new
  def new
    @templabel = Templabel.new
  end

  # GET /templabels/1/edit
  def edit
  end

  # POST /templabels
  # POST /templabels.json
  def create
    @templabel = Templabel.new(templabel_params)

    respond_to do |format|
      if @templabel.save
        format.html { redirect_to templabels_path, notice: 'Templabel was successfully created.' }
        format.json { render :show, status: :created, location: @templabel }
      else
        format.html { render :new }
        format.json { render json: @templabel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /templabels/1
  # PATCH/PUT /templabels/1.json
  def update
    respond_to do |format|
      if @templabel.update(templabel_params)
        format.html { redirect_to @templabel, notice: 'Templabel was successfully updated.' }
        format.json { render :show, status: :ok, location: @templabel }
      else
        format.html { render :edit }
        format.json { render json: @templabel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /templabels/1
  # DELETE /templabels/1.json
  def destroy
    @templabel.destroy
    respond_to do |format|
      format.html { redirect_to templabels_url, notice: 'Templabel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
   def spitcsv
    
    @templabels = Templabel.all
  
   require 'csv'
   require 'net/ftp'
     
      ftp = Net::FTP.new
      ftp.connect("lotusdelivery.com",21)
      ftp.login("jalsamn","t9zVhn~ckCz4")
      ftp.chdir("/public_html")
      ftp.passive = true
     
      header = "barcode,name,price,point"
      file = "barcodelabels.csv"
             CSV.open(file, "w") do |csv|
             csv << ["Barcode", "Name", "Price", "Points"]
               
               
               
              @templabels.each do |c|
                  if !Product.exists?(:barcode => c["barcode"])  
                     
                    
                  else
                    product = Product.find_by barcode: c["barcode"]
                    csv << [product.barcode, product.name, product.price.to_s, product.rewardpoint.to_s] 
                    
                  end
                
             end
           end
     
     ftp.putbinaryfile(file, remotefile = File.basename(file))
     Templabel.delete_all()
     ftp.close
     redirect_to labelmessage_path, :notice => ""
  end
    
  def labelmessage
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_templabel
      @templabel = Templabel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def templabel_params
      params.require(:templabel).permit(:barcode)
    end
  
  
  
end
