class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  get '/messages' do
      messages = Message.all
      messages.to_json
  end

  post '/messages' do
    newmessage = Message.create(
    body: params[:body],
    username: params[:username]
  )
    newmessage.to_json
  end

  patch '/messages/:id' do
    patchmessage = Message.find(params[:id])
    patchmessage.update(
      body: params[:body]
    )
    patchmessage.to_json
  end

  delete '/messages/:id' do
    deletemessage = Message.find(params[:id])
    deletemessage.destroy
    deletemessage.to_json
  end
  
end
