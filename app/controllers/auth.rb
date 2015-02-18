get '/' do
  redirect '/offices'
end

get '/login' do
  erb :'/auth/login'
end

post '/login' do
  user = User.find_by(username: params[:username])
  if user.try(:authenticate, params[:password])
    session[:user_id] = user.id
    redirect '/'
  end
  add_error('username or password are incorrect')
  redirect '/login'
end

get '/signup' do
  erb :'/auth/signup'
end

post '/signup' do
  puts params[:user]
  new_user = User.create(params[:user])
  unless new_user.id
    parse_errors(new_user.errors.messages)
    redirect '/login'
  end
  redirect '/'
end

get '/logout' do
  session.clear
  redirect '/'
end
