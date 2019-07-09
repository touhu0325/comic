class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_name] = @user.name
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/users/#{@user.id}")
    else
      render 'new'
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]

    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end

  def login_form

  end

  def login
    user = User.find_by(email: params[:session][:email])
    # パスワードの一致を検証
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user, notice: 'ログイン成功'
    else
      render :new
    end
  end

  def logout
    session[:user_name] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/")
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirm)
  end

end
