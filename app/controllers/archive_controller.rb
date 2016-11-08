class ArchiveController < ApplicationController
  include ArchiveHelper

  def index
    @articles_by_year_and_month = group_articles_by_year_and_month
  end

  def show

    if params[:id].length > 5
      @month         = params[:id][5..-1]
      @sort_by_month = true
    else
      @year          = params[:id]
      @sort_by_year  = true
    end

    if @sort_by_month
      @year = params[:id][0..3]
      @articles_by_year_and_month = group_articles_by_year_and_month[@year]
      @articles_by_month          = @articles_by_year_and_month[@month]
    else
      @articles_by_year_and_month = group_articles_by_year_and_month[@year]
    end
  end
end
