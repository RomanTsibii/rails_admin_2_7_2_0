class ResourcesController < ApplicationController
  before_action :verify_class, only: %i[index new create]
  before_action :verify_record, except: %i[index new create]

  protected

  def record
    @record ||= record_class.find(params[:id])
  end

  def verify_record
    authorize_with_configs(record)
  end

  def verify_class
    authorize_with_configs(record_class)
  end

  def authorize_with_configs(record)
    return true if policy_class.new(current_user,
                                    record).send("#{action_name}?")

    redirect_back(fallback_location: root_path)
    # flash[:warning] = t "#{policy_name}.#{exception.query}", scope: :pundit, default: :default
    flash[:warning] = 'You cannot perform this action'
  end

  def policy_class
    "#{record_class}Policy".constantize
  end
end
