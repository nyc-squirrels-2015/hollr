get '/reviews' do
  erb :'/reviews/all', locals: { reviews: Review.all }
end

get '/users/:id/reviews' do |user_id|
  erb :"/reviews/list_partial", locals: { reviews: User.find(user_id).reviews }
end