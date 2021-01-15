class CommentsController < ResourcesController
  def create
    article = Article.find(params[:article_id].to_i)
    if Comment.create(commentable: current_user,content: record_params[:content], article: article)
      flash[:success] = MessageHelper.created(record_class.name)
    else
      flash[:warning] = 'Error'
    end
    redirect_to article_path(article)
    # res = Commets::Operations::Create.call(user: current_user, record_params: record_params)
    # byebug
    # p ''

  end

  private

  def record_class
    Comment
  end

  def record_params
    params.require(:comment).permit!
  end
end
