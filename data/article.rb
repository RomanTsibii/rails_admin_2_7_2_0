class Article < ApplicationRecord
  has_many :comments, dependent: :destroy

  has_one_attached :cover_image
  has_rich_text :content

  # validates :content, :title,  presence: true
  def count_comments
    comments.count
  end
end
