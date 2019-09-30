
updated_time = Time.now

post '/reload' do
  if Time.now - updated_time > 600
    update_time = true
    Thread.start do
      $sqldb.update_db
    end
    redirect "/", 303
  else
    status 406
  end
end
