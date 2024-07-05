class BlogPostController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :postnotfound]
  before_action :set_blog_post, only: [:edit, :update, :show, :delete]
  def index
    @blog_posts = BlogPost.all
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(post_params)
    if @blog_post.save
      redirect_to post_path(@blog_post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    rescue ActiveRecord::RecordNotFound
      redirect_to "/postnotfound/#{params[:id]}"
  end

  def update
    if @blog_post.update(post_params)
      redirect_to post_path(@blog_post)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    rescue ActiveRecord::RecordNotFound
      redirect_to "/postnotfound/#{params[:id]}"
  end

  def delete
    @blog_post.destroy
    redirect_to root_path
  end

  def postnotfound
    @missing_post = params[:id]
  end

  private
  def post_params
    params.require(:blog_post).permit(:title, :body)
  end

  def set_blog_post
    @blog_post = BlogPost.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to "/postnotfound/#{params[:id]}"
  end

  def authenticate_user!
    redirect_to new_user_session_path, alert: "You must sign up or sign in to continue" unless user_signed_in?
  end

end