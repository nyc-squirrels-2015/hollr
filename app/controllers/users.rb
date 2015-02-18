get '/users/:id' do |user_id|
  erb :"/users/show", locals: { user: User.find(user_id) }
end

put '/users/:id' do |user_id|
  user = User.find(user_id)
  user.update(params[:user])
  if user.errors.empty?
    redirect '/'
  else
    parse_errors(user.errors.messages)
    
    #CHANGE THIS
    redirect "/users/#{user_id}"
  end
end