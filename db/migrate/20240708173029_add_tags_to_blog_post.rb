class AddTagsToBlogPost < ActiveRecord::Migration[7.1]
  def change
    add_column :blog_posts, :tags, :string
  end
end
