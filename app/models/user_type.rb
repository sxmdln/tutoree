class UserType
  has_many :user
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
end
