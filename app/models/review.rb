class Review < ActiveRecord::Base
  validates :rating, :title, :user_id, :office_id, presence: true

  belongs_to :office
  #belongs_to :author, :class_name => "User" 
  #why doesn't this work?
  belongs_to :user
  has_many :votes, :dependent => :destroy
  has_many :voters, :through => :votes, :source => :user

  def up_votes
    votes.where(verdict: 1).count
  end

  def down_votes
    votes.where(verdict: -1).count
  end

  def net_votes
    up_votes - down_votes
  end

end
