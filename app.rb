require 'sinatra'
require 'pg'
#require 'tiny_tds'
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
   erb :phonebookapp, :locals => {:message => ""}	
end


get '/index' do 
	phonebook = db.exec("SELECT full_name, street_address, city, state, zipcode, cell_phone, work_phone FROM phonebook");
    erb :get_index, :locals => {:phonebook => phonebook}
end

get '/index1' do 
    phonebook = db.exec("SELECT full_name, street_address, city, state, zipcode, cell_phone, work_phone FROM phonebook");
    erb :index1, :locals => {:phonebook => phonebook}	
end

post '/phonebook' do 
	full_name = params[:full_name]
	street_address = params[:street_address]
	city = params[:city]
	state = params[:state]
	zipcode = params[:zipcode]
	cell_phone = params[:cell_phone]
    work_phone = params[:work_phone]
    check_cellphone = db.exec("SELECT * FROM phonebook WHERE cell_phone = '#{cell_phone}'")
    if check_cellphone.num_tuples.zero? == false
    	erb :phonebookapp, :locals => {:message => "Cell Phone number already exist in our database"}
    else
    db.exec("INSERT INTO phonebook(full_name, street_address, city, state, zipcode, cell_phone, work_phone) VALUES('#{full_name}', '#{street_address}', '#{city}', '#{state}', '#{zipcode}', '#{cell_phone}', '#{work_phone}')"); #put the stuffs in the database
    erb :phonebookapp, :locals => {:message => "Thank you"}
    end
end

get '/search' do 
	erb :search
end

post '/results' do 
	find = params[:find]
	findcontacts = params[:findcontacts]
	list = db.exec("SELECT * FROM phonebook WHERE " + find + " ILIKE \'" + findcontacts + "%\'");
	erb :results, :locals => {:list => list}
end