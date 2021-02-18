class Event < ApplicationRecord
  belongs_to :user
  validates_presence_of :event_type, :date, :host, :user_id
  validates :title, presence: true, uniqueness: {scope: [:date, :user_id]}
end
