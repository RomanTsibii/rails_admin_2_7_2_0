class Api::Users::Forms::LogUp < BaseForm
  PERMITTED_ATTRIBUTES = %i[email password password_confirmation first_name last_name phone_number].freeze
  REQUIRED_ATTRIBUTES = %i[email password password_confirmation].freeze

  attr_accessor(*PERMITTED_ATTRIBUTES, :record)

  validates(*REQUIRED_ATTRIBUTES, presence: true)
end
