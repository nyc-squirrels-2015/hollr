require_relative '../spec_helper'

#run bundle exec rake db:test:prepare first!

class ReviewSpec
  describe 'reviews' do
    before(:each) do
      @a_user = User.create(username: 'pequod', fname: 'jim', lname: 'jones', email: 'jimjones@abc.com', password: 'abc')
      @another_user = User.create(username: 'ahab', fname: 'tim', lname: 'owens', email: 'timowens@abc.com', password: 'abc')
      @an_office = Office.create(name: 'Dr. Chachki', addr1: "345 Mulberry Ln", city: 'Roanoke', state: 'VA', zip: '24327')
      @a_review =  Review.create(rating: 5, title: 'Nice guy!', content: "Seriously, he's nice", user_id: @a_user.id, office_id: @an_office.id)
      @vote_1 = Vote.create(verdict: 1, user_id: @a_user.id, review_id: @a_review.id)
      @vote_2 = Vote.create(verdict: -1, user_id: @another_user.id, review_id: @a_review.id)

    end

    after(:each) do
      User.destroy_all
      Office.destroy_all
      Review.destroy_all
    end

    it 'should return the number of up votes' do
      expect(@a_review.up_votes).to eq(1)
    end

    it 'should return the number of down votes' do
      expect(@a_review.down_votes).to eq(1)
    end

     it 'should return the net tally' do
      expect(@a_review.net_votes).to eq(0)
    end

    it 'should know the name of the office being reviewed' do
      expect(@a_review.office.name).to eq('Dr. Chachki')
    end

    it 'should know who voted on it' do
      expect(@a_review.voters.first.username).to eq('pequod')
    end


  end
end