class UserEvent < ApplicationRecord
  belongs_to :event
  belongs_to :invited_user, class_name: 'User'
end