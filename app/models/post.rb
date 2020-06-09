class Post < ApplicationRecord
  belongs_to :user
  belongs_to :theme
  def self.search_by_content(search)
    if search
      Post.where("content ILIKE ?", "%#{search}%")
    end
  end

  def self.search_by_theme(id_theme)
    Post.where(theme_id: id_theme)
  end
end
