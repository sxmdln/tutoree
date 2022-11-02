class User  
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword
  include ActiveModel::Validations
  field :email_address, type: String
  field :password_digest, type: String
  field :contact_number, type: String
  field :is_active, type: Mongoid::Boolean
  field :type, type: String
  validates :email_address, uniqueness: true
  validates :type, presence: true
  validates :password, presence: true, :length => { :minimum => 9}, :on => :create
  has_secure_password
  has_one :tutee
  has_one :tutor
end
