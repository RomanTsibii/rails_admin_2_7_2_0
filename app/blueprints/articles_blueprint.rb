class ArticlesBlueprint < Blueprinter::Base
  identifier :id

  fields :title, :content
  field :locale do |_, options|
    options[:locale]
  end

  view :with_comments do
    association :comments, blueprint: CommentsBlueprint
  end
end
