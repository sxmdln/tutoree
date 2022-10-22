class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :email_address, type: String
  field :contact_number, type: String
  field :string, type: String
  field :password, type: String
  field :is_active, type: Mongoid::Boolean
end
