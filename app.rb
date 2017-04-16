require 'sinatra'
require 'pg'
load './local_env.rb' if File.exist?('./local_env.rb')

db_params = {
	host: ENV['host'],
	port: ENV['port'],
	dbname: ENV['db_name'],
	user: ENV['user'],
	password: ENV['password']
}
db = PG::Connection.new(db_params)

get '/' do 
    phonebook = db.exec("SELECT first_name, last_name, street_address, city, state, zipcode, cell_phone, home_phone, work_phone FROM phonebook");
    erb :get_index, :locals => {:phonebook => phonebook}	
end

get '/index' do 
	phonebook = db.exec("SELECT first_name, last_name, street_address, city, state, zipcode, cell_phone, home_phone, work_phone FROM phonebook");
    erb :get_index, :locals => {:phonebook => phonebook}
end

get '/index1' do 
    phonebook = db.exec("SELECT first_name, last_name, street_address, city, state, zipcode, cell_phone, home_phone, work_phone FROM phonebook");
    erb :index1, :locals => {:phonebook => phonebook}	
end

post '/phonebook' do 
	first_name = params[:first_name]
	last_name = params[:last_name]
	street_address = params[:street_address]
	city = params[:city]
	state = params[:state]
	zipcode = params[:zipcode]
	cell_phone = params[:cell_phone]
	home_phone = params[:home_phone]
    work_phone = params[:work_phone]
    db.exec("INSERT INTO phonebook(first_name, last_name, street_address, city, state, zipcode, cell_phone, home_phone, work_phone) VALUES('#{first_name}', '#{last_name}', '#{street_address}', '#{city}', '#{state}', '#{zipcode}', '#{cell_phone}', '#{home_phone}', '#{work_phone}')"); #put the stuffs in the database
    redirect '/'
end
get '/search' do 
	phonebook = ""
	erb :search, :locals => {:phonebook => phonebook}
end
post '/results' do 
	search_array = params[:search]
	results = search(search_array)
	erb :results, :locals => {:phonebook => phonebook}
end