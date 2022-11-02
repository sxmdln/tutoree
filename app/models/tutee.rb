class Tutee

  include Mongoid::Document
  include Mongoid::Timestamps
  field :user_id, type: String
  field :first_name, type: String
  field :last_name, type: String
  field :profile_picture, type: String
  field :string, type: String
  field :birthdate, type: Time
  field :address, type: String
  field :school_id, type: String
  field :string, type: String
  field :matriculation_form, type: String
  field :string, type: String
  field :average_rating, type: BigDecimal
  field :is_active, type: Mongoid::Boolean
  field :payment_info, type: String

  belongs_to :user
  has_one :accepted_tutee
end
