class RoomsController < ApplicationController

  def index
    @rooms = Room.all
    @reservations = Reservation.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:name, :address, :charge, :introduction, :image, :user_id))
    @room.user_id = current_user.id # ログイン中のユーザーで投稿
    if @room.save
        flash[:alert] = "新規登録しました"
        redirect_to controller: 'users', action: 'show', id: current_user.id
    else
        render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def search
    if params[:address].present?
      @rooms = Room.where('address LIKE ?', "%#{params[:address]}%")
    elsif params[:name].present?
      @rooms = Room.where("name LIKE ?", "%#{params[:name]}%")
    else
      @rooms = Room.all # allをnoneにすると検索しない
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "削除しました"
    redirect_to :rooms
  end
end
