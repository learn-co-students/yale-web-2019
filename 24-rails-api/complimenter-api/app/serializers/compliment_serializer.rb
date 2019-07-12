class ComplimentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :message
end
