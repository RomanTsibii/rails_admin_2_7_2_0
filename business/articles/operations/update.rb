class Articles::Operations::Update < BaseOperation
  def call
    build_form
    return validation_fail(:bad_request) unless form_valid?

    assign_attributes
    return validation_fail(:bad_request) unless save_record

    response(:ok, args.merge!(record: record, form: form))
  end

  private

  def form_class
    Articles::Forms::Create
  end
end
