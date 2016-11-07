class ArticlesController < ApplicationController
  before_filter :require_login, except: [:index, :show]

  include ArticlesHelper

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @article.increase_view_count

    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
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

  def popular
    @most_popular_articles = Article.all.sort_by(&:view_count).first(10).reverse!
  end

  def archive
    @articles_by_year  = Article.all.group_by { |article| article.created_at.strftime("%Y") }
    @articles_by_month = Article.all.group_by { |article| article.created_at.strftime("%B") }
    @articles_by_month_new = @articles_by_year.group_by { |article| article.created_at.strftime("%B") }
  end

  def month
    @articles_by_month = Article.all.group_by { |article| article.created_at.strftime("%B") }
    @month = params[:month]
    @articles = @articles_by_month[@month]
  end
end
