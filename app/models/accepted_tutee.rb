class AcceptedTutee
  has_one :tutor
  belongs_to :tutee
  include Mongoid::Document
  include Mongoid::Timestamps
  field :status, type: String
end
