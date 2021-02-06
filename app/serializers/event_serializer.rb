class EventSerializer < ActiveModel::Serializer
  attributes :id, :type, :host, :date, :title
 belongs_to :user
end
