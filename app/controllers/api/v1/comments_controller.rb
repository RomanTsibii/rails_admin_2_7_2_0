class Api::V1::CommentsController < ApiController
  def create
    res = Comments::Operations::Create.call(record_params: record_params)
    render json: CommentsBlueprint.render(res.data[:record]), status: res.status.to_sym
  end

  def update
    res = Comments::Operations::Update.call(record: record, record_params: record_params)
    render json: CommentsBlueprint.render(res.data[:record]), status: res.status.to_sym
  end

  def destroy
    render json: {}, status: Comments::Operations::Destroy.call(record: record).status.to_sym
  end

  private

  def record_params
    article = Article.find(params[:article_id]) # TODO: set error if article not found
    current_user = User.last # TODO: remove after create sing in
    params.require(:comment).permit!.merge!(commentable: current_user, article: article)
  end

  def record_class
    Comment
  end
end
