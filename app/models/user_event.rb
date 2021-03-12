class UserEvent < ApplicationRecord
  belongs_to :event_creator
  belongs_to :invited_user
  belongs_to :event
end
