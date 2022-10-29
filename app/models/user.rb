class User
  #include ActiveModel::Validations
  include Mongoid::Document
  include Mongoid::Timestamps

  field :email_address, type: String
  field :password_digest, type: String
  field :contact_number, type: String
  field :is_active, type: Mongoid::Boolean

  #has_many :user_type 
end
