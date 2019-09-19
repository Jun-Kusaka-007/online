class SessionsController < ApplicationController
  before_action :login_please, only: [:destroy]
  before_action :login_now, only: [:new, :create]
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to "/users/#{user.id}", notice: 'ログインに成功しました'
    else
       render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url, notice: 'ログアウトに成功しました'
  end

end
