class Api::V1::TodosController < JSONAPI::ResourceController
  before_action :doorkeeper_authorize!

  def index
    if params[:complete].present?
      render json: serialize_records(current_user.todos.where(complete: params_to_bool(params[:complete])))
    else
      super
    end
  end

  def params_to_bool(value)
    value.downcase == 'true'
  end

  def resourced_result(result)
    result.map {|object| Api::V1::TodoResource.new(object) }
  end

  def serialize_records(result)
    serializer.serialize_to_hash resourced_result(result)
  end

  def serializer
    @serializer ||= JSONAPI::ResourceSerializer.new(Api::V1::TodoResource)
  end

  def context
    {current_user: current_user}
  end

  def current_user
    @current_user ||= User.find(doorkeeper_token[:resource_owner_id]) if doorkeeper_token
  end
end
