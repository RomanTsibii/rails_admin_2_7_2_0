class Comments::Operations::Create < BaseOperation
  def call
    build_record
    build_form
    return validation_fail(:bad_request) unless form_valid?

    assign_attributes
    return validation_fail(:bad_request) unless save_record

    response(:created, args.merge!(record: record, form: form))
  end

  private

  def build_record
    @record = record_class.new
  end

  def form_class
    Comments::Forms::Create
  end

  def record_class
    Comment
  end
end
