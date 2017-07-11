class BaseController < ApplicationController
  include ApiError
  before_action :set_resource, only: [:destroy, :show, :update]

  resource_description do
    api_version '1.0'
  end

  def_param_group :pagination do
    param :page, String
    param :per_page, String
  end

  # POST /api/{plural_resource_name}
  def create
    set_resource(resource_class.new(resource_params))

    if get_resource.save
      render :create, status: :created
    else
      render json: get_resource.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/{plural_resource_name}/1
  def destroy
    get_resource.destroy
    head :no_content
  end

  # GET /api/{plural_resource_name}
  def index
    plural_resource_name = "@#{resource_name.pluralize}"
    resources = resource_class.where(query_params)
                    .page(page_params[:page])
                    .per(page_params[:page_size])

    instance_variable_set(plural_resource_name, resources)
    respond_with instance_variable_get(plural_resource_name)
  end

  # GET /api/{plural_resource_name}/1
  def show
    respond_with get_resource
  end

  # PATCH/PUT /api/{plural_resource_name}/1
  def update
    if get_resource.update(resource_params)
      render :update
    else
      render json: get_resource.errors, status: :unprocessable_entity
    end
  end

  # Error Handling
  rescue_from(Error) { |e| handle_error(e) }

  private

  def handle_error(error)
    return unless error.is_a?(Error)
    respond_to do |format|
      format.json { render json: { error: error.error, message: error.message }, status: error.status }
    end
  end

  # Returns the resource from the created instance variable
  def get_resource
    instance_variable_get("@#{resource_name}")
  end

  # Override this method in each API controller to
  # permit additional parameters to seach on
  def query_params
    {}
  end

  # Allowed params for pagination
  def page_params
    params.permit(:page, :per_page)
  end

  # Resource class based on the controller
  def resource_class
    @resource_class ||= resource_name.classify.constantize
  end

  # Singular name for the resource class based on the controller
  def resource_name
    @resource_name ||= self.controller_name.singularize
  end

  # Override in each API controller to limit permitted params for the specific model
  def resource_params
    @resource_paarams ||= self.send("#{resource_name}_params")
  end

  def set_resource(resource = nil)
    resource ||= resource_class.find(params[:id])
    instance_variable_set("@#{resource_name}", resource)
  end

end
