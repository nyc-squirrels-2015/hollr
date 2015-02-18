class Office < ActiveRecord::Base
  validates :name, :addr1, :city, :state, :zip, presence: true

  has_many :reviews

  def avg_review
    num_reviews = self.reviews.count
    self.reviews.all.map { |review| review.rating }.inject(:+) / num_reviews
  end


end
