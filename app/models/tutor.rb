class Tutor
  include Mongoid::Document
  include Mongoid::Timestamps

  field :first_name, type: String
  field :last_name, type: String
  field :profile_picture, type: String
  field :birthdate, type: Time
  field :address, type: String
  field :occupation, type: String
  field :skill_category, type: String
  field :certification, type: String
  field :price_per_hour, type: BigDecimal
  field :is_active, type: Mongoid::Boolean

  belongs_to :user
  has_one :accepted_tutee
  accepts_nested_attributes_for :accepted_tutee
end
