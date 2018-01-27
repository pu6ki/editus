class RoomsController < ApplicationController
  before_action :set_room, only: [:show]
  before_action :authenticate_user!

  def index
    @rooms = Room.all
  end

  def show
    @message = Message.new
  end

  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.build(room_params)

    if @room.save
      flash[:success] = 'Room successfully created'
      redirect_to rooms_path
    else
      render 'new'
    end
  end

  private

  def set_room
    @room = Room.includes(:messages).find(params[:id])
  end

  def room_params
    params.require(:room).permit(:title)
  end
end
