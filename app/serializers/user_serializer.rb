class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :address
  has_many :apiusers
end
