class RinventorsController < ApplicationController
  before_action :set_rinventor, only: [:show, :edit, :update, :destroy]

  # GET /rinventors
  # GET /rinventors.json
  def index
    @rinventors = Rinventor.all
  end

  # GET /rinventors/1
  # GET /rinventors/1.json
  def show
  end

  # GET /rinventors/new
  def new
    @rinventor = Rinventor.new
  end

  # GET /rinventors/1/edit
  def edit
  end

  # POST /rinventors
  # POST /rinventors.json
  def create
    @rinventor = Rinventor.new(rinventor_params)

    respond_to do |format|
      if @rinventor.save
        format.html { redirect_to @rinventor, notice: 'Rinventor was successfully created.' }
        format.json { render :show, status: :created, location: @rinventor }
      else
        format.html { render :new }
        format.json { render json: @rinventor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rinventors/1
  # PATCH/PUT /rinventors/1.json
  def update
    respond_to do |format|
      if @rinventor.update(rinventor_params)
        format.html { redirect_to @rinventor, notice: 'Rinventor was successfully updated.' }
        format.json { render :show, status: :ok, location: @rinventor }
      else
        format.html { render :edit }
        format.json { render json: @rinventor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rinventors/1
  # DELETE /rinventors/1.json
  def destroy
    @rinventor.destroy
    respond_to do |format|
      format.html { redirect_to rinventors_url, notice: 'Rinventor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rinventor
      @rinventor = Rinventor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rinventor_params
      params.require(:rinventor).permit(:update_date, :rproductid, :starting_amount, :added_amount, :threshold, :sold_amount, :actual_amount, :theoretical_ending_inventory)
    end
end
