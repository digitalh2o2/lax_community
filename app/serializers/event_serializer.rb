class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  has_many :comments
end
