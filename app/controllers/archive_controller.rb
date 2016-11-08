class ArchiveController < ApplicationController
  include ArchiveHelper

  def index
    @articles_by_year_and_month = group_articles_by_year_and_month
  end

  def show
    check_if_year_or_month

    if @month
      @year = params[:id][0..3]
      @articles_by_year_and_month = group_articles_by_year_and_month[@year]
      @articles_by_month          = @articles_by_year_and_month[@month]
    else
      @articles_by_year_and_month = group_articles_by_year_and_month[@year]
    end
  end
end
