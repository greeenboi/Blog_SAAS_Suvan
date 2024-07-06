class BlogPostController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :postnotfound]
  before_action :set_blog_post, only: [:edit, :update, :show, :delete]
  def index
    @blog_posts = user_signed_in? ? BlogPost.sorted : BlogPost.published.sorted
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
      redirect_to post_not_found_path
  end

  def delete
    @blog_post.destroy
    redirect_to root_path
  end

  def postnotfound
  end

  private
  def post_params
    params.require(:blog_post).permit(:title, :body, :published_at)
  end

  def set_blog_post
    @blog_post = user_signed_in? ? BlogPost.find(params[:id]) : BlogPost.published.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to post_not_found_path
  end

  def authenticate_user!
    redirect_to new_user_session_path, alert: "You must sign up or sign in to continue" unless user_signed_in?
  end

end