class ResourcesController < ApplicationController
  protected

  def record
    @record ||= record_class.find(params[:id])
  end
end
