module MessageHelper
  module_function

  def not_authorized
    'You are not authorized to perform this action.'
  end

  def updated(resource = 'Data')
    action(resource, 'updated')
  end

  def created(resource = 'Data')
    action(resource, 'created')
  end

  def deleted(resource = 'Data')
    action(resource, 'deleted')
  end

  def saved(resource = 'Data')
    action(resource, 'saved')
  end

  def action(resource = 'Data', action = 'saved')
    "#{resource} successfully #{action}"
  end
end
