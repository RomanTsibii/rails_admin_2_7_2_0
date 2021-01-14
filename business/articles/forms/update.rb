class Articles::Forms::Update < BaseForm
  PERMITTED_ATTRIBUTES = %i[title content cover_image].freeze
  REQUIRED_ATTRIBUTES = %i[].freeze

  attr_accessor(*PERMITTED_ATTRIBUTES, :record)
end
