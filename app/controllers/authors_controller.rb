class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update, :destroy]

  before_filter :user_is_not_admin,             except: [:show]
  before_filter :zero_authors_or_authenticated, only:   [:new, :create]
  before_filter :require_login,                 except: [:show]

  def user_is_not_admin
    redirect_to root_path unless admin?
  end

  def zero_authors_or_authenticated
    return if Author.count.zero? || current_user
    redirect_to root_path
    false
  end

  def index
    @authors = Author.all
    @title   = "Authors"
  end

  def show
    @title = set_author.username
    @articles = @author.articles.order(created_at: :desc)
  end

  def new
    @author = Author.new
    @title  = "New author"
  end

  def edit
    @title = "Editing: #{set_author.username}"
  end

  def create
    @author = Author.new(author_params)

    respond_to do |format|
      if @author.save
        format.html { redirect_to @author, notice: 'Author was successfully created.' }
        format.json { render :show, status: :created, location: @author }
      else
        format.html { render :new }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @author.update(author_params)
        format.html { redirect_to @author, notice: 'Author was successfully updated.' }
        format.json { render :show, status: :ok, location: @author }
      else
        format.html { render :edit }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @author.destroy

    respond_to do |format|
      format.html { redirect_to authors_url, notice: 'Author was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:username, :email,
                                   :password, :password_confirmation)
  end
end
