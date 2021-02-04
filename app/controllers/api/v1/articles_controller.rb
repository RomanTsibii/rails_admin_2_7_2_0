class Api::V1::ArticlesController < ApiController
  # skip_before_action :authenticate_user!, only: %i[index show create]

  def index
    render json: ArticlesBlueprint.render(records), status: :ok
  end

  def show
    render json: ArticlesBlueprint.render(
      record,
      view: :with_comments,
      locale: I18n.locale
    ), status: :ok
  end

  def create
    res = Articles::Operations::Create.call(record_params: record_params)
    render json: ArticlesBlueprint.render(res.data[:record], locale: I18n.locale), status: res.status.to_sym
  end

  def update
    res = Articles::Operations::Update.call(record_params: record_params, record: record)
    render json: ArticlesBlueprint.render(res.data[:record], locale: I18n.locale), status: res.status.to_sym
  end

  def destroy
    render json: {}, status: Articles::Operations::Destroy.call(record: record).status.to_sym
  end

  private

  def record_params
    params.require(:article).permit!.merge!(article: params[:article_id])
  end

  def record_class
    Article
  end
end
