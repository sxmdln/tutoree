class AcceptedTutee
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :tutee_id, type: BSON::ObjectId
  field :tutor_id, type: BSON::ObjectId
  field :name, type: String
  field :price, type: Integer
  field :date_duration, :type => DateTime
end
