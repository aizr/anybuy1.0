class Bid < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  attr_accessible :user, :product, :user_id, :product_id, :bindprice
end
