class ReservationsController < ApplicationController
  def show
    @reservation = Reservation.find(params[:id])
  end

  def create
    @reservation = @restaurant.reservations.build(reservation_params)
    @reservation.user_id = current_user.id

    if @reservation.save
      redirect_to restaurants_path, notice: 'Reservation created successfully'
    else
      render :action => :show
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
  end

  private
  def reservation_params
    params.require(:reservation).permit(:reservation_date, :restaurant_id)
  end
end
