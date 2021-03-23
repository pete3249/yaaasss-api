class EventSerializer
  include JSONAPI::Serializer
  attributes :id, :event_creator, :name, :start_time, :end_time, :location, :address, :notes

  attribute :event_creator do |event|
    {id: event.event_creator.id, username: event.event_creator.username}
  end 

  attribute :invited_users do |event|
    event.invited_users.map do |user|
      { id: user.id, username: user.username, user_event: user.invited_events.find{ |e| e.event_id == event.id}.id }
    end
  end 

  attribute :attendees do |event|
    event.attendees.map do |user|
      { id: user.id, username: user.username, user_event: event.attendees.find{|a| a.id === user.id}.invited_events.find_by(event_id: event.id).id }
    end
  end 

end
