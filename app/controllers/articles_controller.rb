class ArticlesController < ApplicationController
  include ArticlesHelper

  before_filter :require_login, only: [:new, :create, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    @article = find_article
    #Why do we use Comment.new instead of @article.comments.new??
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save

    flash.notice = "'#{@article.title}' created!"

    redirect_to article_path(@article)
  end

  def destroy
    @article = find_article
    @article.destroy

    flash.notice = "'#{@article.title}' deleted!"

    redirect_to articles_path
  end

  def edit
    @article = find_article
  end

  def update
    @article = find_article
    @article.update(article_params)

    flash.notice = "'#{@article.title}' updated!"

    redirect_to article_path(@article)
  end
end
