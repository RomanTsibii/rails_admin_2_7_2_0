class CommentsController < ResourcesController
  def create
    res = Comments::Operations::Create.call(record_params: record_params)
    if res.created?
      flash[:success] = MessageHelper.created(record_class.name)
    else
      flash[:alert] = res.errors
    end
    redirect_back(fallback_location: root_path)
  end

  def update
    res = Comments::Operations::Update.call(record: record, record_params: record_params)
    if res.ok?
      flash[:success] = MessageHelper.updated(record_class.name)
    else
      flash[:alert] = res.errors
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def record_class
    Comment
  end

  def record_params
    article = Article.find(params[:article_id])
    params.require(:comment).permit!.merge!(commentable: current_user, article: article)
  end
end
