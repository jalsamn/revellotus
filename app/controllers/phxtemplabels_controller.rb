class PhxtemplabelsController < ApplicationController
  layout 'templabel'
  before_action :set_phxtemplabel, only: [:show, :edit, :update, :destroy]

  @myvar = "class-level"
  
  # GET /phxtemplabels
  # GET /phxtemplabels.json
  def index
    @templabel = Phxtemplabel.new
    @templabels = Phxtemplabel.all
  end

  # GET /phxtemplabels/1
  # GET /phxtemplabels/1.json
  def show
  end

  # GET /phxtemplabels/new
  def new
    @templabel = Phxtemplabel.new
  end

  # GET /phxtemplabels/1/edit
  def edit
  end

  # POST /phxtemplabels
  # POST /phxtemplabels.json
  def create
    @templabel = Phxtemplabel.new(phxtemplabel_params)

    respond_to do |format|
      if @templabel.save
        format.html { redirect_to phxtemplabels_path, notice: 'Label was successfully created.' }
        format.json { render :show, status: :created, location: @templabel }
      else
        format.html { render :new }
        format.json { render json: @templabel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phxtemplabels/1
  # PATCH/PUT /phxtemplabels/1.json
  def update
    respond_to do |format|
      if @templabel.update(phxtemplabel_params)
        format.html { redirect_to @templabel, notice: 'phxtemplabel was successfully updated.' }
        format.json { render :show, status: :ok, location: @templabel }
      else
        format.html { render :edit }
        format.json { render json: @templabel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phxtemplabels/1
  # DELETE /phxtemplabels/1.json
  def destroy
    @templabel.destroy
    respond_to do |format|
      format.html { redirect_to phxtemplabels_url, notice: 'phxtemplabel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
   def spitcsv
    
    @templabels = Phxtemplabel.all
  
   require 'csv'
   require 'net/ftp'
     
      ftp = Net::FTP.new
      ftp.connect("lotusdelivery.com",21)
      ftp.login("jalsamn","t9zVhn~ckCz4")
      ftp.chdir("/public_html")
      ftp.passive = true
     
      header = "barcode,name,price,point"
      file = "barcodelabelsphx.csv"
             CSV.open(file, "w") do |csv|
             csv << ["Barcode", "Name", "Price", "Points"]
               
               
               
              @templabels.each do |c|
                  if !Product.exists?(:barcode => c["barcode"])  
                    
                  else
                    product = Product.find_by_barcode_and_location(c["barcode"], "/enterprise/Establishment/3/")
                    csv << [product.barcode, product.name, product.price.to_s, product.rewardpoint.to_s] 
                    
                  end
                
             end
           end
     
     ftp.putbinaryfile(file, remotefile = File.basename(file))
     Phxtemplabel.delete_all()
     ftp.close
     redirect_to phxlabelmessage_path, :notice => ""
   end
    

  
  def labelmessage
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phxtemplabel
      @templabel = Phxtemplabel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def phxtemplabel_params
      params.require(:phxtemplabel).permit(:barcode)
    end
  
  
end
