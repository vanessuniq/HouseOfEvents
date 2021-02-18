class EventSerializer < ActiveModel::Serializer
  attributes :id, :event_type, :host, :date, :title
 belongs_to :user
end
