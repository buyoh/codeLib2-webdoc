$enable_cart = false
$codelib_path ||= '../codeLib2'
$version = `git log --oneline -n 1 --pretty=format:'%h(%cd)'`.chomp

require 'sinatra'
require 'sinatra/reloader' if development?
# require 'sinatra/cookies'
require 'sass'
require 'json'
require 'uri'
require 'logger'

require_relative 'lib/dbhelper'
require_relative 'lib/dbsolver'

$sqldb = DBHelper.new

# - - - - - - - - - - - - - - - - - - - - - - -

def set_cookie(name, value, expires = 3600 * 3)
  value = JSON.generate(value) unless value.is_a? String
  response.set_cookie(name, value: value, expires: Time.now + expires, path: '/')
end

def get_cookie(name)
  j = request.cookies[name]
  h = nil
  if j
    begin
      h = JSON.parse(URI.unescape(j))
    rescue JSON::JSONError
      h = nil
    end
  end
  h
end

# - - - - - - - - - - - - - - - - - - - - - - -

configure do
  Dir.chdir("#{$codelib_path}/tools") do
    $sqldb.create_db
    $sqldb.update_db
  end
end

before do
end

Dir.glob('controller/*.rb') do |c|
  load c, true
end
