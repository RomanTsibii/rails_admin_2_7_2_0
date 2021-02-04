class CommentsBlueprint < Blueprinter::Base
  identifier :id

  fields :content, :article_id
  association :commentable, blueprint: UserBlueprint
end
