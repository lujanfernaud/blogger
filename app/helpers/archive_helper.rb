module ArchiveHelper

  def group_articles_by_year_and_month
    articles_by_year = Article.all.group_by { |article| article.created_at.strftime("%Y") }

    articles_by_year.each do |year, month|
      articles_by_year[year] = month.group_by { |article| article.created_at.strftime("%B") }
    end
  end
end
