class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:edit, :update, :destroy]

  def index
    @reservations = current_user.reservations
  end

  def new
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new(room: @room)
  end

  def confirm_new
    if params[:reservation].present?
      @room = Room.find(params[:reservation][:room_id])
      @reservation = current_user.reservations.build(reservation_params.merge(room: @room))
      if @reservation.valid?
        render :confirm_new
      elsif
        render 'rooms/show'
      else
        redirect_to errors_reservation_error_path
      end
    end
  end

  def edit
    @room = @reservation.room
    if current_user == @room.user
      @editable = true
    else
      @editable = false
    end
  end

  def confirm_edit
    @reservation = Reservation.find(params[:id])
    @reservation.attributes = reservation_params
    render :edit if @reservation.invalid?
  end

  def create
    @room = Room.find_by(id: params.dig(:reservation, :room_id))
    @reservation = current_user.reservations.build(reservation_params.merge(room: @room))
    if @reservation.save
      redirect_to reservations_path
    else
      render 'rooms/show'
    end
  end

  def update
    if @reservation.update(reservation_params)
      redirect_to reservations_path
    else
      render :edit
    end
  end

  def destroy
    @reservation.destroy
    redirect_to reservations_path
  end


  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:room_id, :avatar, :name, :total_fee, :detail, :check_in, :check_out, :num, :stay_days)
  end
end


