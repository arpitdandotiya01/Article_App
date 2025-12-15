class ArticlesController < ApplicationController
  def home; end
  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :desc))
    if @article.save
      redirect_to article_path(@article)
    else
      render :new, status: :unprocessable_entity
    end
  end
end