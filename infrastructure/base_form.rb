# frozen_string_literal: true

class BaseForm
  include ActiveModel::Model

  attr_accessor :record, :params

  def initialize(params, record: nil)
    @params = params
    @record = record
    # Slice all attributes which is not required by form
    # to omit save of unpredictable params
    @params.slice!(*permitted_attributes)

    super(@params)
  end

  def permitted_attributes
    self.class::PERMITTED_ATTRIBUTES
  end

  def sync_errors_to_form
    return if record.blank?

    record.errors.each do |code, body|
      errors.add(code, body)
    end
  end

  def sync_errors_to_record
    return if record.blank?

    errors.each do |code, body|
      record.errors.add(code, body) unless record.errors[code].include?(body)
    end
  end

  def collect_errors
    nested_errors = try(:nested_forms)&.map { |nf| nf&.errors&.messages }&.compact&.uniq.try(:[], 0)
    nested_errors = nested_errors.presence || {}
    errors.messages.merge!(nested_errors)
  end
end
