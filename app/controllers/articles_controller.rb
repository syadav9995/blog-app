class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :delete]

  def show
      
  end

  def index
      @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def new
      @article = Article.new
  end

  def create
      @article = Article.new(article_params)
      @article.user = current_user
      if @article.save
          flash[:notice] = "Article was created successfully."
          redirect_to @article
      else
          render 'new'
      end
  end

  def edit
      
  end

  def update
      if @article.update(article_params)
          flash[:notice]= "updated sucessfully"
          redirect_to articles_path
      else
          render 'edit'
      end
  end
    
    def destroy
      @article.destroy
      flash[:notice]= "article deleted sucessfully"
      redirect_to articles_path
    end

    private
    def set_article
      @article =Article.find(params[:id])
    end
    def article_params
      params.require(:article).permit(:name, :title, category_ids: [])
    end

    def require_same_user
      if @article.user != current_user && !current_user.admin?
        flash[:notice]= "you can perform this action on your article only"
        redirect_to @article
      end
    end
end