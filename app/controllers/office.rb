get '/offices' do
  erb :'/offices/all', locals: { offices: Office.all }
end

get '/offices/:id' do |id|
  erb :'/offices/one', locals: { office: Office.find(id) }
end