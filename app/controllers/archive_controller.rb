class ArchiveController < ApplicationController

  def index
    @articles_by_year = Article.all.group_by { |article| article.created_at.strftime("%Y") }

    @articles_by_year.each do |year, month|
      @articles_by_year[year] = month.group_by { |article| article.created_at.strftime("%B") }
    end

    @articles_by_year_and_month = @articles_by_year
  end

  def show
    @articles_by_month = Article.all.group_by { |article| article.created_at.strftime("%B") }
    @month = params[:id]
    @articles = @articles_by_month[@month]
  end
end
