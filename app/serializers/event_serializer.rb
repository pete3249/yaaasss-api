class EventSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :description, :start_time, :end_time, :location, :notes
end
