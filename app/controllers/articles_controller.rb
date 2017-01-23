class ArticlesController < ApplicationController
  before_filter :require_login, except: [:index, :show, :popular, :about]
  before_filter :find_article, only: [:show, :edit, :update, :destroy]

  include ArticlesHelper

  def index
    @articles = Article.all.reverse
    @title = "All Articles"
  end

  def home
    @latest_article = Article.last
    @articles_in_home = Article.all.reverse[1..6]
  end

  def show
    @article.increase_view_count

    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def popular
    @most_popular_articles = Article.all.sort_by(&:view_count).reverse.first(10)
    @title = "Most Popular Articles"
  end

  def new
    @article = Article.new
    @title = "New article"
  end

  def edit
    @title = "Edit article"
  end

  def update
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' updated."

    redirect_to article_path(@article)
  end

  def create
    @article = Article.new(article_params)
    @article.author = current_user

    @article.save

    flash.notice = "Article '#{@article.title}' created."

    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy

    flash.notice = "Article '#{@article.title}' deleted."

    redirect_to articles_path
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end
end
