class AcceptedTutee
  belongs_to :tutor
  belongs_to :tutee
  include Mongoid::Document
  include Mongoid::Timestamps
  field :status, type: String
end
