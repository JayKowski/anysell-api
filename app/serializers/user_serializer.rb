class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email_address, :location, :mobile_number, :about, :created_at, :updated_at
end
