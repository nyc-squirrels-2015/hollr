get '/offices' do
  erb :'/offices/all', locals: { offices: Office.all }
end