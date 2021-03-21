class Event < ApplicationRecord
  belongs_to :event_creator, class_name: "User"
  has_many :user_events
  has_many :invited_users, -> { where 'going = false'}, through: :user_events, source: :invited_user
  has_many :attendees, -> { where 'going = true'}, through: :user_events, source: :invited_user
end
