module I18nLocalise
  extend ActiveSupport::Concern

  included do
    before_action :set_locale
    # before_action :default_url_options
  end

  def set_locale
    I18n.locale = extract_locale || I18n.default_locale
  end

  def extract_locale
    parsed_locale = params[:locale]
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end
end
