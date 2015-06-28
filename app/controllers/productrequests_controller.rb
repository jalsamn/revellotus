class ProductrequestsController < ApplicationController
  layout 'productrequest'
  http_basic_authenticate_with name: "admin", password: "1af2af3af4af5", except: [:new, :create]
  before_action :set_productrequest, only: [:show, :edit, :update, :destroy]

  # GET /productrequests
  # GET /productrequests.json
  def index
    @productrequests = Productrequest.all
    respond_to do |format|
      format.html
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"product-requests.csv\""
        headers['Content-Type'] ||= 'text/csv'
    end
  end
  end

  # GET /productrequests/1
  # GET /productrequests/1.json
  def show
  end

  # GET /productrequests/new
  def new
    @productrequest = Productrequest.new
  end

  # GET /productrequests/1/edit
  def edit
  end

  # POST /productrequests
  # POST /productrequests.json
  def create
    @productrequest = Productrequest.new(productrequest_params)
    respond_to do |format|
      if @productrequest.save
        format.html { 
          flash[:success] = "Your product request has been created"       
              #SENDING EMAIL TO ADMIN THAT REQUEST HAS BEEN SUBMITED          
              ProductrequestMailer.productrequest_email(@productrequest).deliver
              #SENDING EMAIL TO CUSTOMER THAT WE HAVE RECEIVED YOUR EMAIL
              ProductrequestMailer.productrequest_inprogress_email(@productrequest).deliver
          
              #BELOW IS CODE FOR SUBSCRIBING USER TO OUR MAILCHIMP LIST USING GIBBON
              gb = Gibbon::API.new("93f3019f32a6215c04959711c63d894e-us3")
              gb.lists.subscribe({:id => '8bacae7aa7', :email => {:email => @productrequest.email}, :merge_vars => {:FNAME => 'First Name', :LNAME => 'Last Name'}, :double_optin => false})
          
          redirect_to new_productrequest_path }
        format.json { render :show, status: :created, location: @productrequest }
      else
        format.html { render :new }
        format.json { render json: @productrequest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /productrequests/1
  # PATCH/PUT /productrequests/1.json
  def update
    respond_to do |format|
      if @productrequest.update(productrequest_params)
        format.html { redirect_to @productrequest, notice: 'Productrequest was successfully updated.' }
        format.json { render :show, status: :ok, location: @productrequest }
      else
        format.html { render :edit }
        format.json { render json: @productrequest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productrequests/1
  # DELETE /productrequests/1.json
  def destroy
    @productrequest.destroy
    respond_to do |format|
      format.html { redirect_to productrequests_url, notice: 'Productrequest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_productrequest
      @productrequest = Productrequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def productrequest_params
      params.require(:productrequest).permit(:name, :email, :phone, :fullfilled, :location)
    end
end
