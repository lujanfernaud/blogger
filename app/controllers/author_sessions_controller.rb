class AuthorSessionsController < ApplicationController
  before_filter :require_login, except: [:new, :create, :destroy]

  def new
  end

  def create
    if login(params[:email], params[:password])
      redirect_to(:root) && return if controller_name == 'author_sessions'
      redirect_to(:back)
    else
      flash[:notice] = 'Login failed. Incorrect email or password.'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:authors, notice: 'Logged out!')
  end
end
