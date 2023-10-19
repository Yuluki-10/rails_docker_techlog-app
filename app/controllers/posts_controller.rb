class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = '投稿しました'
      redirect_to root_path # 一時的にトップページへリダイレクト（要修正）
    else
      flash[:alert] = '投稿に失敗しました'
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content) # post属性を必須とし、title,content属性を許可
  end
end
