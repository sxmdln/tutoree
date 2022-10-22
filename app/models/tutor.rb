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
  field :price_per_hour, type: Decimal
  field :average_rating, type: Decimal
  field :number_of_reviews, type: Integer
  field :number_of_tutees, type: Integer
  field :is_active, type: Mongoid::Boolean
  field :payment_info, type: String
end
