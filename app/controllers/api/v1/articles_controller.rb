class Api::V1::ArticlesController < ApiController
  skip_before_action :authenticate_request, only: %i[index show]

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
    return render json: ArticlesBlueprint.render(res.data[:record], locale: I18n.locale), status: res.status.to_sym if res.created?

    render json: { error: res.data[:errors] }, status: res.status.to_sym
  end

  def update
    res = Articles::Operations::Update.call(record_params: record_params, record: record)
    return render json: ArticlesBlueprint.render(res.data[:record], locale: I18n.locale), status: res.status.to_sym if res.ok?

    render json: { error: res.data[:errors] }, status: res.status.to_sym
  end

  def destroy
    head Articles::Operations::Destroy.call(record: record).status.to_sym
  end

  private

  def record_params
    params.require(:article).permit!
  end

  def record_class
    Article
  end
end
