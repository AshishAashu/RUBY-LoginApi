class ApiuserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password, :course
end
