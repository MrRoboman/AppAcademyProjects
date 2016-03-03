module ArticlesHelper
  def article_params
    params.require(:article).permit(:title, :body, :tag_list, :image)
  end

  def find_article
    Article.find(params[:id])
  end

  def self.months
    Article.all.sort_by { |article| article.updated_at.month }.map { |article| article.updated_at.strftime("%B") }.uniq
    Article.all.map {|a| a.updated_at}
  end

  def self.most_popular count = nil
    count ||= Article.all.count
    Article.all.sort_by { |article| article.view_count || 0 }.reverse.take(count)
  end
end
