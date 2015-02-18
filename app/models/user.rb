class User < ActiveRecord::Base
  has_secure_password

  validates :username, :email, {presence: true, uniqueness: true}
  
  has_many :reviews
  has_many :votes
  has_many :voted_on_reviews, :through => :votes, :source => :review

end
