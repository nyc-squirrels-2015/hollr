class Office < ActiveRecord::Base
  validates :name, :addr1, :city, :state, :zip, presence: true

  has_many :reviews, :dependent => :destroy

  def avg_review
    num_reviews = reviews.count
    reviews.all.map { |review| review.rating }.inject(:+) / num_reviews
  end


end
