get '/reviews' do
  erb :'/reviews/all', locals: { reviews: Review.all }
end

get '/reviews/:id' do |id|
  erb :'/reviews/one', locals: { review: Review.find(id) }
end

put '/reviews/:id' do |id|
  review = Review.find(id)
  review.update(params[:review])
  if review.errors.empty?
    redirect '/'
  else
    parse_errors(user.errors.messages)
    
    #CHANGE THIS
    redirect "/reviews/#{id}"
  end
end

delete '/reviews/:id' do |id|
  review = Review.find(id)
  review.destroy
  redirect '/'
end
