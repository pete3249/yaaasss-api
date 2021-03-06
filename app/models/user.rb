class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :created_events, class_name: 'Event', foreign_key: :event_creator_id
  has_many :invited_events, class_name: 'UserEvent', foreign_key: :invited_user_id
end
