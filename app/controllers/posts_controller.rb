class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = '投稿しました'
      redirect_to posts_path # 投稿一覧へリダイレクト
    else
      flash[:alert] = '投稿に失敗しました'
      render :new
    end
  end

  def show
    # @post = Post.find_by(id: params[:id])スッキリしないから自分はfindにした
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.limit(10).order(created_at: :desc)
  end

  private

    def post_params
      params.require(:post).permit(:title, :content) # post属性を必須とし、title,content属性を許可
    end
end
