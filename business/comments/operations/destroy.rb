class Comments::Operations::Destroy < BaseOperation
  def call
    response(:bad_request, args) unless destroy_record

    response(:no_content, args)
  end

  private

  def destroy_record
    record.destroy
  end
end
