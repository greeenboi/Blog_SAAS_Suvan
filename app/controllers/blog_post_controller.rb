class BlogPostController < ApplicationController
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
    @blog_post = BlogPost.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to "/postnotfound/#{params[:id]}"
  end

  def update
    @blog_post = BlogPost.find(params[:id])
    if @blog_post.update(post_params)
      redirect_to post_path(@blog_post)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @blog_post = BlogPost.find(params[:id])
  rescue ActiveRecord::RecordNotFound
  redirect_to "/postnotfound/#{params[:id]}"
  end

  def postnotfound
    @missing_post = params[:id]
  end

  private
  def post_params
    params.require(:blog_post).permit(:title, :body)
  end

end