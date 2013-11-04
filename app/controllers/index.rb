#view all created notes
get '/' do
  @notes = Note.all :order => "id DESC" 
  erb :index
end

#adding a note
get '/notes/add' do
  erb :add
end

post '/notes/add' do
  note = Note.create(text: params[:text])
  redirect '/'
end

#viewing a single note
get '/notes/:id' do
  @note = Note.find(params[:id])
  erb :edit
end

#editing a note
put '/notes/:id' do
  Note.update(params[:id],:text => params[:text])
  redirect '/'
end

get '/notes/:id/confirm' do
  @note = Note.find(params[:id])
  erb :confirm_delete
end


delete '/notes/:id' do
  Note.destroy(params[:id])
  redirect '/'
end