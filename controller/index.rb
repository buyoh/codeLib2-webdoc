get '/' do
  @docs = $sqldb.all_index_db_solved
  erb :index
end

get '/index.json' do
  content_type :json
  @docs = $sqldb.all_index_db_solved
  @docs.to_json
end
