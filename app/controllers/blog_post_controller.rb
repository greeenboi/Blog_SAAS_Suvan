class BlogPostController < ApplicationController
  def index
    @blog_posts = BlogPost.all
  end

  def show
    @blog_post = BlogPost.find(params[:id])
  rescue ActiveRecord::RecordNotFound
  redirect_to "/postnotfound/#{params[:id]}"
  end

  def postnotfound
    @missing_post = params[:id]
  end

end