module ArchiveHelper

  def check_if_year_or_month
    if params[:id].length > 5
      @month         = params[:id][5..-1]
      @sort_by_month = true
    else
      @year          = params[:id]
      @sort_by_year  = true
    end
  end

  def group_articles_by_year_and_month
    sorted_articles  = Article.all.sort_by { |article| article.created_at }
    articles_by_year = sorted_articles.reverse.group_by { |article| article.created_at.strftime("%Y") }

    articles_by_year.each do |year, month|
      articles_by_year[year] = month.group_by { |article| article.created_at.strftime("%B") }
    end
  end
end
