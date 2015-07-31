class Api::V1::TodoResource < JSONAPI::Resource
  attributes :title, :complete
  has_one :user

  before_create :set_user

  filter :complete

  # prevent the api call from manually assigning user
  def self.updatable_fields(context)
    super - [:user]
  end

  def self.creatable_fields(context)
    super - [:user]
  end

  private

  def set_user
    current_user = context[:current_user]
    # assign user to the todo model
    # grab the current_user from context hash
    @model.assign_attributes({user: current_user})
  end
end
