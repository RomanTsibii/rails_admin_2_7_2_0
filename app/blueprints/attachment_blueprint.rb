class AttachmentBlueprint < Blueprinter::Base
  identifier :service_url
  fields :content_type, :byte_size
end
