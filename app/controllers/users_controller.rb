class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @room = Room.new
    @rooms = @user.rooms 
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:name, :email, :image, :introduction))
      flash[:notice] = "ユーザーIDが「#{@user.id}」の情報を更新しました"
      redirect_to :users
    else
      render "edit"
    end
  end
end
