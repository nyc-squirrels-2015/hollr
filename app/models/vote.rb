class Vote < ActiveRecord::Base
  validates :verdict, :user_id, :review_id, presence: true

  belongs_to :user
  belongs_to :review
end
