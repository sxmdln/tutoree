class AcceptedTutee
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :status, type: String

  belongs_to :tutor
  belongs_to :tutee
end
