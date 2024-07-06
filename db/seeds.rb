# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Seed BlogPosts
blog_posts = [
  { title: "First Post", body: "This is the first post.", published_at: Time.now },
  { title: "Second Post", body: "This is the second post.", published_at: Time.now }
]

blog_posts.each do |post_attributes|
  BlogPost.find_or_create_by!(title: post_attributes[:title]) do |post|
    post.body = post_attributes[:body]
    post.published_at = post_attributes[:published_at]
  end
end