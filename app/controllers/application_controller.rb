class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    

    def after_sign_in_path_for(resource) 
        home_top_path # ログイン後に遷移するpathを設定 
    end

    def after_sign_out_path_for(resource)
        home_top_path # ログアウト後に遷移するpathを設定 
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) # 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する
    end
    
    def index
        @users = User.all
        @rooms = Room.all #roomsテーブルの全データを取得する
    end

    def create
        @puser = User.new(user_params)
    end

    def show
        @user = User.find(params[:id])
        @room = Room.new
        @rooms = @user.rooms 
    end

    def update
        if @user.update(user_params)
          redirect_to root_path
        else
          render :edit
        end
    end

    private
    def post_params
        params.require(:user).permit(:image)
    end
end
