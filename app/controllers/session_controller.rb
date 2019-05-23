class SessionController < ApplicationController
  def create
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user_id
    else
      render 'create'
  end
end
