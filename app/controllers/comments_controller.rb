class CommentsController < ResourcesController
  def create
    article = Article.find(params[:article_id])
    res = Comments::Operations::Create.call(
      record_params: record_params.merge!(commentable: current_user, article: article)
    )
    if res.created?
      flash[:success] = MessageHelper.created(record_class.name)
    else
      flash[:alert] = res.errors
    end
    redirect_to article_path(article)
  end

  private

  def record_class
    Comment
  end

  def record_params
    params.require(:comment).permit!
  end
end
