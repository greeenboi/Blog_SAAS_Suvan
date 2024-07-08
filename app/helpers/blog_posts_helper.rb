module BlogPostsHelper
  def tag_color(tag)
    case tag
    when 'news'
      'red'
    when 'update'
      'blue'
    when 'feature'
      'green'
    when 'guide'
      'teal'
    when 'announcement'
      'purple'
    else
      'gray'
    end
  end
end# frozen_string_literal: true


