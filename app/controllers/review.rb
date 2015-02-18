get '/reviews' do
  erb :'/reviews/all', locals: { reviews: Review.all }
end
