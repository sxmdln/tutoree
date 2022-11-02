class UserType
  belongs_to :user
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
end
