class AuthenticationBlueprint < Blueprinter::Base
  identifier :id
  fields :email, :role
  field :jwt_token do |_, options|
    options[:jwt_token]
  end
end
