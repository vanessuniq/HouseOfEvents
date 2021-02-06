class Event < ApplicationRecord
  belongs_to :user
  validates_presence_of :type, :date, :host, :user_id
  validates :title, presence: true, uniqueness: {scope: [:date, :user_id]}
end
