class User  
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword
  include ActiveModel::Validations

  field :email_address, type: String
  field :password_digest, type: String
  field :contact_number, type: String
  field :is_activated, type: Mongoid::Boolean
  field :type, type: String

  validates :email_address, uniqueness: true  # , format:{with: /[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]/}
  validates :contact_number, uniqueness: true
  validates :type, presence: true
  validates :password, presence: true, :length => { :minimum => 9}, :on => :create

  has_secure_password
  has_one :tutees
  has_one :tutors
  accepts_nested_attributes_for :tutees
  accepts_nested_attributes_for :tutors
end


