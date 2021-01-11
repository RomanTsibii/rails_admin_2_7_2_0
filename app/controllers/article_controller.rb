class ArticleController < ApplicationController
  def index
    @articles = Article.all.with_rich_text_content_and_embeds
  end


  def show
    @article = Article.find(params[:id])
    UserMailer.welcome_email(current_user).deliver_later if current_user.present?
  end
end
