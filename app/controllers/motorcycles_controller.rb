class MotorcyclesController < ApplicationController
  before_action :set_motorcycle, only: %i[ show edit update destroy ]

  # GET /motorcycles or /motorcycles.json
  def index
    @motorcycles = Motorcycle.all
  end

  # GET /motorcycles/1 or /motorcycles/1.json
  def show
  end

  # GET /motorcycles/new
  def new
    @motorcycle = Motorcycle.new
  end

  # GET /motorcycles/1/edit
  def edit
  end

  # POST /motorcycles or /motorcycles.json
  def create
    @motorcycle = Motorcycle.new(motorcycle_params)

    respond_to do |format|
      if @motorcycle.save
        format.html { redirect_to motorcycle_url(@motorcycle), notice: "Motorcycle was successfully created." }
        format.json { render :show, status: :created, location: @motorcycle }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @motorcycle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /motorcycles/1 or /motorcycles/1.json
  def update
    respond_to do |format|
      if @motorcycle.update(motorcycle_params)
        format.html { redirect_to motorcycle_url(@motorcycle), notice: "Motorcycle was successfully updated." }
        format.json { render :show, status: :ok, location: @motorcycle }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @motorcycle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /motorcycles/1 or /motorcycles/1.json
  def destroy
    @motorcycle.destroy

    respond_to do |format|
      format.html { redirect_to motorcycles_url, notice: "Motorcycle was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_motorcycle
      @motorcycle = Motorcycle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def motorcycle_params
      params.require(:motorcycle).permit(:model_no, :model_name, :finance_fee, :purchase_fee, :production_date, :description)
    end
end
