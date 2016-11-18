class ArticlesController < ApplicationController
  before_filter :require_login, except: [:index, :show, :popular, :about]

  include ArticlesHelper

  def index
    @articles = Article.all.reverse
  end

  def show
    @article = Article.find(params[:id])
    @article.increase_view_count

    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def popular
    @most_popular_articles = Article.all.sort_by(&:view_count).reverse.first(10)
    @title = "Most Popular Articles"
  end

  def about
  end

  def new
    @article = Article.new
    @title   = "New article"
  end

  def edit
    @article = Article.find(params[:id])
    @title   = "Edit article"
  end

  def update
    @article = Article.find(params[:id])
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
    @article = Article.find(params[:id])
    @article.destroy

    flash.notice = "Article '#{@article.title}' deleted."

    redirect_to articles_path
  end
end
