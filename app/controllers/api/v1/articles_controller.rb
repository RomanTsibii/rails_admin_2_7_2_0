class Api::V1::ArticlesController < ApiController
  # skip_before_action :authenticate_user!, only: %i[index show create]

  def index
    articles = Article.all
    respond_with do |format|
      format.json { render json: articles.to_json }
    end
  end

  def show
    article = Article.find(params[:id])
    respond_with do |format|
      format.json { render json: article.to_json }
    end
  end

  # def create
  #   res = Articles::Operations::Create(record_params: record_params)
  #   respond_to.json { res.data.to_json }
  # end
  #
  # private
  #
  # def record_params
  #   params.require(:articles).permit!
  # end
end
