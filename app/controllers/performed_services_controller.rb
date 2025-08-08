class PerformedServicesController < ApplicationController
  before_action :authenticate!  

  def index
    performed_services = PerformedServiceResource.all(params)
    respond_with(performed_services)
  end

  def show
    performed_service = PerformedServiceResource.find(params)
    respond_with(performed_service)
  end

  def create
    performed_service = PerformedServiceResource.build(params)

    if performed_service.save
      render jsonapi: performed_service, status: 201
    else
      render jsonapi_errors: performed_service
    end
  end

  def update
    performed_service = PerformedServiceResource.find(params)

    if performed_service.update_attributes
      render jsonapi: performed_service
    else
      render jsonapi_errors: performed_service
    end
  end

  def destroy
    performed_service = PerformedServiceResource.find(params)

    if performed_service.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: performed_service
    end
  end
end
