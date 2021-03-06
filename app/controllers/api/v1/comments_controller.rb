class Api::V1::CommentsController < ApiController
  def create
    res = Comments::Operations::Create.call(record_params: record_params)
    return render json: CommentsBlueprint.render(res.data[:record]), status: res.status.to_sym if res.created?

    render json: { error: res.data[:errors] }, status: res.status.to_sym
  end

  def update
    res = Comments::Operations::Update.call(record: record, record_params: record_params)
    return render json: CommentsBlueprint.render(res.data[:record]), status: res.status.to_sym if res.ok?

    render json: { error: res.data[:errors] }, status: res.status.to_sym
  end

  def destroy
    head Comments::Operations::Destroy.call(record: record).status.to_sym
  end

  private

  def record_params
    article ||= Article.find_by(id: params[:article_id])
    params.require(:comment).permit!.merge!(commentable: current_user, article: article)
  end

  def record_class
    Comment
  end
end
