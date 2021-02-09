class ArticlesBlueprint < Blueprinter::Base
  identifier :id

  fields :title, :content
  field :locale do |_article, options|
    options[:locale]
  end

  view :with_comments do
    association :comments, blueprint: CommentsBlueprint
  end

  association :cover_image, blueprint: AttachmentBlueprint, if: ->(_field_name, article, _options) { article.cover_image.attached? }
end
