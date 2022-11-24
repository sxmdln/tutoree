class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :author_id, type: BSON::ObjectId
  field :post_name, type: String
  field :post_price, type: Integer
  field :skill_category, type: String
  field :is_accepted, type: Mongoid::Boolean, default: false
  field :date_posted, type: Time

end
