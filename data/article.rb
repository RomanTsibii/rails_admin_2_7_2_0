class Article < ApplicationRecord
  has_many :comments, dependent: :destroy

  has_one_attached :cover_image

  # I18n for admin globalize with action text
  translates :title, :content
  accepts_nested_attributes_for :translations, allow_destroy: true

  delegate :content, to: :translation
  delegate :content=, to: :translation

  after_save do
    content.save if content.changed?
  end

  class Translation
    has_rich_text :content
  end

  # validates :content, :title,  presence: true
  def count_comments
    comments.count
  end
end
