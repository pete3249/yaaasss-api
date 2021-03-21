class EventSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :start_time, :end_time, :location, :address, :notes, :invited_users, :attendees

  attribute :invited_users do |events|
    events.invited_users.map do |user|
      { id: user.id, username: user.username}
    end
  end 

  attribute :attendees do |events|
    events.attendees.map do |user|
      { id: user.id, username: user.username}
    end
  end 

end
