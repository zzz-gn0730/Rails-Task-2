class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  def index
  @rooms = current_user.rooms
  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      redirect_to @room
    else
      render :new
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = current_user.reservations.build(room: @room)
    if current_user == @room.user
      @editable = true
    else
      @editable = false
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to room_path
    else
      render :edit
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.reservations.destroy_all
    @room.destroy
    redirect_to rooms_path
  end

  private

  def set_room
    @room = Room.find_by(id: params[:id])
  end

  def room_params
    params.require(:room).permit(:avatar, :name, :detail, :fee, :address, :created_date)
  end
end

