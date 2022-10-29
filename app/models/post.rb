class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :post_name, type: String
  field :post_price, type: Decimal
  field :skill_category, type: String
  field :is_accepted, type: Mongoid::Boolean
  field :date_posted, type: Time

  belongs_to :tutee
end
