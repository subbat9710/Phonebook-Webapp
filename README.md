# Phonebook WebApp
The Phonebook App is a simple web application that allows users to store and retrieve contact information, including names, addresses, and phone numbers. It is built using the Sinatra framework and uses a PostgreSQL database to store the contact information.

The main aim of the application is to provide a simple, user-friendly interface for managing contact information. Users can add new contacts to the database, and search for contacts by name or phone number or by address.

## Requirements for this projects
1. Download pgAdmin (latest version recomended)
2. Create AWS(Amazon Web Service) account (Add aws link in the localhost section)
3. Install pg from Terminal
4. Also install 'gem install bundler'
5. Sinatra is required
6. PostgreSQL is required

Getting started

## To run the application, follow these steps:
* Clone the repository to your local machine.
* Run bundle install to install the required dependencies.
* Set up your PostgreSQL database using pgAdmin or the terminal.
* Update the config/database.yml file with your PostgreSQL database credentials.
* Run rake db:migrate to create the necessary database tables.
* Run ruby app.rb to start the application.
* Open http://localhost:4567 in your web browser to access the application.

## Aim of project...
* Store and retrieve name, address, and phone number data in a PostgreSQL database.
* Allow users to search for data using a search button

