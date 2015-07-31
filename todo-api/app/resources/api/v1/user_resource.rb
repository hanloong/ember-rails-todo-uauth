class Api::V1::UserResource < JSONAPI::Resource
  attributes :email
  has_many :todos
end
