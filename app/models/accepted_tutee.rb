class AcceptedTutee
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, type: String
  field :price, type: Integer

  belongs_to :tutor
  belongs_to :tutee
end
