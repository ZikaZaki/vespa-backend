class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show edit update destroy]

  # GET /reservations or /reservations.json
  def index
    if @current_user&.admin? # if current_user is admin
      all_reservations
    else # if current_user is not admin
      user_reservations
    end
  end

  # GET /reservations/all
  def all_reservations
    @reservations = Reservation.all.includes(:user, :motorcycle, :city)
    render json: @reservations.map { |reservation|
      {
        id: reservation.id,
        user_id: reservation.user_id,
        username: reservation.user.username,
        user: reservation.user.email,
        city: reservation.city.name,
        motorcycle: reservation.motorcycle.name,
        motorcycle_image: rails_blob_url(reservation.motorcycle.image),
        reserve_date: reservation.reserve_date,
        returning_date: reservation.returning_date,
        created_at: reservation.created_at,
        updated_at: reservation.updated_at
      }
    }
  end

  # GET /reservations/user
  def user_reservations
    @reservations = @current_user.reservations.all.includes(:city, :motorcycle)
    render json: @reservations.map { |reservation|
      {
        id: reservation.id,
        user_id: reservation.user_id,
        username: reservation.user.username,
        user: reservation.user.email,
        city: reservation.city.name,
        motorcycle: reservation.motorcycle.name,
        motorcycle_image: rails_blob_url(reservation.motorcycle.image),
        returning_date: reservation.returning_date,
        reserve_date: reservation.reserve_date,
        created_at: reservation.created_at,
        updated_at: reservation.updated_at
      }
    }
  end

  # GET /reservations/1 or /reservations/1.json
  def show; end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit; end

  # POST /reservations or /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)
    # @reservation.user = @current_user

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to reservation_url(@reservation), notice: 'Reservation was successfully created.' }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1 or /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to reservation_url(@reservation), notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1 or /reservations/1.json
  def destroy
    @reservation.destroy

    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.require(:reservation).permit(:reserve_date, :returning_date, :user_id, :motorcycle_id, :city_id)
  end
end
