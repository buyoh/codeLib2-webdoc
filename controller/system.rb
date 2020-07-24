# frozen_string_literal: true

updated_time = Time.now

post '/reload' do
  if Time.now - updated_time > 60
    updated_time = Time.now
    Thread.start do
      Dir.chdir("#{$codelib_path}/tools") do
        $sqldb.update_db
      end
    end
    redirect '/', 303
  else
    status 406
  end
end
