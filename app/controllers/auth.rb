get '/' do
  erb :welcome
end

get '/login' do
  
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
