class User
  #has_one :user_type 
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::Validations
  field :email_address, type: String
  field :contact_number, type: String
  field :string, type: String
  field :password, type: String
  field :is_active, type: Mongoid::Boolean
end
