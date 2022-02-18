class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    @rooms = Room.all
  end

  def new
    @reservation = Reservation.new
  end

  def confirm
    @reservation = Reservation.new(@reservation)
    if @reservation.invalid?
      render :new 
    end
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:start_date, :end_date, :person, :room_name, :room_introduction, :room_charge, :room_image, :room_id))
    if @reservation.save
      flash[:notice] = "新規予約をしました"
      redirect_to :rooms
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
