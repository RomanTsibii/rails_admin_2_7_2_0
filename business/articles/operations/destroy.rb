class Articles::Operations::Destroy < BaseOperation
  def call
    response(:bad_request, args) unless delete_record

    response(:no_content, args)
  end

  private

  def delete_record
    record.destroy
  end
end
