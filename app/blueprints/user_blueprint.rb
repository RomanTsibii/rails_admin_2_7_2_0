class UserBlueprint < Blueprinter::Base
  identifier :id

  fields :email, :role, :first_name, :last_name, :phone_number
end
