require_relative '../spec_helper'

#run bundle exec rake db:test:prepare first!

class ReviewSpec
  describe 'reviews' do
    before(:each) do
      @a_user = User.create(username: 'pequod', fname: 'jim', lname: 'jones', email: 'jimjones@abc.com', password: 'abc')
      @an_office = Office.create(name: 'Dr. Chachki', addr1: "345 Mulberry Ln", city: 'Roanoke', state: 'VA', zip: '24327')
      @a_review =  Review.create(rating: 5, title: 'Nice guy!', content: "Seriously, he's nice", user_id: @a_user.id, office_id: @an_office.id)
    end

    after(:each) do
      User.destroy_all
      Office.destroy_all
      Review.destroy_all
    end

    it 'should respond to get /reviews/:id' do
      get "/reviews/#{@a_review.id}"
      expect(last_response).to be_ok
      expect(last_response.body).to include 'Net score:'
    end

    it 'should respond to delete /reviews' do
      delete "/reviews/#{@a_review.id}"
      expect(Review.find_by(id: @a_review.id)).to be_nil
    end
  end
end