module ArticlesHelper
  def article_params
    params.require(:article).permit(:title, :body)
  end
  
  def find_article
    Article.find(params[:id])
  end
end
