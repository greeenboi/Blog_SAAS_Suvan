# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# 100.times do |i|
#   BlogPost.create!(
#     title: "Blog Post #{i}",
#     content: "This is the content for blog post #{i}",
#     published_at: Time.current - i.days
#   )
# end

# (0..99).each do |i|
#   BlogPost.where(title: "Blog Post #{i}").find_each do |post|
#     post.destroy
#   end
# end

user = User.where(email: "suvan.gowrishanker.204@gmail.com").first_or_initialize
user.update!(
  password: "#Heavenwater1",
  password_confirmation: "#Heavenwater1"
)