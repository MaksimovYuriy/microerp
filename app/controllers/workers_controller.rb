class WorkersController < ApplicationController
  before_action :authenticate!

  def index
    workers = WorkerResource.all(params)
    respond_with(workers)
  end

  def show
    worker = WorkerResource.find(params)
    respond_with(worker)
  end

  def create
    worker = WorkerResource.build(params)

    if worker.save
      render jsonapi: worker, status: 201
    else
      render jsonapi_errors: worker
    end
  end

  def update
    worker = WorkerResource.find(params)

    if worker.update_attributes
      render jsonapi: worker
    else
      render jsonapi_errors: worker
    end
  end

  def destroy
    worker = WorkerResource.find(params)

    if worker.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: worker
    end
  end
end
