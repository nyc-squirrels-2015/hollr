class User < ActiveRecord::Base
  has_secure_password

  validates :username, :email, {presence: true, uniqueness: true}
  
  has_many :reviews, :dependent => :destroy
  has_many :votes, :dependent => :destroy
  has_many :voted_on_reviews, :through => :votes, :source => :review, :dependent => :destroy

end
