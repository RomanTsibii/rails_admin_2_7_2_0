class ArticlesController < ResourcesController
  def index
    @articles = Article.order(:id)
  end

  def show
    @article = record_class.find(params[:id])
    # UserMailer.welcome_email(current_user).deliver_later if current_user.present?
  end

  def new
    @article = Article.new
  end

  def create
    res = Articles::Operations::Create.call(record_params: record_params)
    if res.created?
      flash[:success] = MessageHelper.created(record_class.name)
      redirect_to articles_path
    else
      flash[:alert] = res.errors # html_humanize_errors(res.errors)
      redirect_to new_article_path
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    res = Articles::Operations::Update.call(record: record, record_params: record_params)
    if res.ok?
      flash[:success] = MessageHelper.created(record_class.name)
      redirect_to articles_path
    else
      flash[:alert] = res.errors # html_humanize_errors(res.errors)
      redirect_to edit_article_path
    end
  end

  def destroy
    res = Articles::Operations::Destroy.call(record: record)
    if res.no_content?
      flash[:success] = MessageHelper.destroyed(record_class.name)
    else
      flash[:alert] = res.error
    end
    redirect_to articles_path
  end

  private

  def record_params
    params.require(:article).permit!
  end

  def record_class
    Article
  end
end
