class Review < ActiveRecord::Base
  validates :rating, :title, :user_id, :office_id, presence: true

  has_many :votes
  has_many :voters, :through => :votes, :source => :user

end
