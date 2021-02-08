class UserBlueprint < Blueprinter::Base
  identifier :id

  fields :email, :role, :first_name, :last_name, :phone_number

  view :login do
    excludes :phone_number, :first_name, :last_name

    field :jwt_token do |_, options|
      options[:jwt_token]
    end

    field :expired_at do |_, option|
      option[:expired_at]
    end
  end
end
