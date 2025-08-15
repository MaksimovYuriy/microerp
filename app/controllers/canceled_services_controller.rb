class CanceledServicesController < ApplicationController
  def index
    canceled_services = CanceledServiceResource.all(params)
    respond_with(canceled_services)
  end

  def show
    canceled_service = CanceledServiceResource.find(params)
    respond_with(canceled_service)
  end

  def create
    canceled_service = CanceledServiceResource.build(params)

    if canceled_service.save
      render jsonapi: canceled_service, status: 201
    else
      render jsonapi_errors: canceled_service
    end
  end

  def update
    canceled_service = CanceledServiceResource.find(params)

    if canceled_service.update_attributes
      render jsonapi: canceled_service
    else
      render jsonapi_errors: canceled_service
    end
  end

  def destroy
    canceled_service = CanceledServiceResource.find(params)

    if canceled_service.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: canceled_service
    end
  end
end
