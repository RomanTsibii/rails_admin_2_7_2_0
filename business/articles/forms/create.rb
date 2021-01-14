class Articles::Forms::Create < BaseForm
  PERMITTED_ATTRIBUTES = %i[title content cover_image].freeze
  REQUIRED_ATTRIBUTES = %i[title content].freeze

  attr_accessor(*PERMITTED_ATTRIBUTES, :record)

  validates(*REQUIRED_ATTRIBUTES, presence: true)
end
