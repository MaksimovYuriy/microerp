class ServiceMaterialsController < ApplicationController
  before_action :authenticate!

  def index
    service_materials = ServiceMaterialResource.all(params)
    respond_with(service_materials)
  end

  def show
    service_material = ServiceMaterialResource.find(params)
    respond_with(service_material)
  end

  def create
    service_material = ServiceMaterialResource.build(params)

    if service_material.save
      render jsonapi: service_material, status: 201
    else
      render jsonapi_errors: service_material
    end
  end

  def update
    service_material = ServiceMaterialResource.find(params)

    if service_material.update_attributes
      render jsonapi: service_material
    else
      render jsonapi_errors: service_material
    end
  end

  def destroy
    service_material = ServiceMaterialResource.find(params)

    if service_material.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: service_material
    end
  end
end
