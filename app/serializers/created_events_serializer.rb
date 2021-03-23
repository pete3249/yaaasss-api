class CreatedEventsSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :start_time, :end_time, :location, :address, :notes

  attribute :invited_users do |event|
    event.invited_users.map do |user|
      { id: user.id, username: user.username }
    end
  end 

  attribute :attendees do |event|
    event.attendees.map do |user|
      { id: user.id, username: user.username}
    end
  end 
  
end
