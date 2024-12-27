class TaskSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :description, :completed
end
