class Office < ActiveRecord::Base
  validates :name, :addr1, :city, :state, :zip, presence: true

  has_many :reviews


end
