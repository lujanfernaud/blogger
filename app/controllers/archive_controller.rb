class ArchiveController < ApplicationController

  def index
    @articles_by_year = Article.all.group_by { |article| article.created_at.strftime("%Y") }

    @articles_by_year.each do |year, month|
      @articles_by_year[year] = month.group_by { |article| article.created_at.strftime("%B") }
    end

    @articles_by_year_and_month = @articles_by_year
  end

  def show

    if params[:id].length > 5
      @month = params[:id][5..-1]
      @sort_by_month = true
    else
      @year = params[:id]
      @sort_by_year = true
    end

    if @month
      @year = params[:id][0..3]

      @articles_by_year = Article.all.group_by { |article| article.created_at.strftime("%Y") }

      @articles_by_year.each do |year, month|
        @articles_by_year[year] = month.group_by { |article| article.created_at.strftime("%B") }
      end

      @articles_by_year_and_month = @articles_by_year[@year]
      @articles_by_month = @articles_by_year_and_month[@month]

    else
      @articles_by_year = Article.all.group_by { |article| article.created_at.strftime("%Y") }

      @articles_by_year.each do |year, month|
        @articles_by_year[year] = month.group_by { |article| article.created_at.strftime("%B") }
      end

      @articles_by_year_and_month = @articles_by_year[@year]
    end
  end
end
