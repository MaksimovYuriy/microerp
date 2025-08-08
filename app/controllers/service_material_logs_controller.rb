class ServiceMaterialLogsController < ApplicationController
  before_action :authenticate!

  def index
    service_material_logs = ServiceMaterialLogResource.all(params)
    respond_with(service_material_logs)
  end

  def show
    service_material_log = ServiceMaterialLogResource.find(params)
    respond_with(service_material_log)
  end

  def create
    service_material_log = ServiceMaterialLogResource.build(params)

    if service_material_log.save
      render jsonapi: service_material_log, status: 201
    else
      render jsonapi_errors: service_material_log
    end
  end

  def update
    service_material_log = ServiceMaterialLogResource.find(params)

    if service_material_log.update_attributes
      render jsonapi: service_material_log
    else
      render jsonapi_errors: service_material_log
    end
  end

  def destroy
    service_material_log = ServiceMaterialLogResource.find(params)

    if service_material_log.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: service_material_log
    end
  end
end
