class Event < ApplicationRecord
  belongs_to :event_creator, class_name: "User"
  has_many :user_events
  has_many :invited_users, through: :user_events, source: :invited_user
end


