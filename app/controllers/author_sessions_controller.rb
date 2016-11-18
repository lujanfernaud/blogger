class AuthorSessionsController < ApplicationController
  before_filter :require_login, except: [:new, :create, :destroy]

  def new
    redirect_to(:root) && return if logged_in?
  end

  def create
    if login(params[:email], params[:password])
      redirect_to(:root) && return if flash[:notice]
      redirect_to(:back)
    else
      @title = "Login"
      flash[:notice] = 'Login failed. Incorrect email or password.'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:back)
  end
end
