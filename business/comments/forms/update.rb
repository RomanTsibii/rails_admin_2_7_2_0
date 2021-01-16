class Articles::Forms::Update < BaseForm
  PERMITTED_ATTRIBUTES = %i[content].freeze
  REQUIRED_ATTRIBUTES = %i[].freeze

  attr_accessor(*PERMITTED_ATTRIBUTES, :record)
end
