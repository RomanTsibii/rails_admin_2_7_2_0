class Comments::Forms::Create < BaseForm
  PERMITTED_ATTRIBUTES = %i[commentable article content].freeze
  REQUIRED_ATTRIBUTES = %i[commentable article content].freeze

  attr_accessor(*PERMITTED_ATTRIBUTES, :record)

  validates(*REQUIRED_ATTRIBUTES, presence: true)
end
