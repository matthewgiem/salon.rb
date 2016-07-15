# Matt's Salon

#### This is a web page I made for Matt's Salon

#### By Matthew Giem

## Description

like to the github <https://github.com/matthewgiem/salon.rb>

web page that allows the owner of Matt's salon to manage their business

Matt's Salon

|specs |
|---------|
|  As a salon owner, I want to view, add, update and delete stylists. |
|  As a salon owner, I want to view, add, update and delete clients. |
|  As a salon owner, I want to add clients to a stylist.  |

## Setup/Installation Requirements


To install this repository into a new project each time, first

* Clone the github repository using the git clone command from the terminal
* Open the file with atom to inspect the code
* to initialize the database in the terminal first enter "$ postgress", then opening a new terminal enter "$ psql" to get in to the database
* to create the DataBase enter "$ CREATE DATABASE hair_salon"
* navigate to the database with "$ \c hair_salon"
* to create the necessary tables first connect to the database with "$ CREATE TABLE clients (id serial PRIMARY KEY, name varchar);" and "$ CREATE TABLE stylists (id serial PRIMARY KEY, name varchar, stylist_id int);"
* then create a test database for the specs to run with "$ CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon"
* if you wish to view a live version of the site open up a third terminal window navigate to the cloned folder and enter "$ ruby app.rb"
* Go the the URL http://localhost:4567 and view the site

## Known Bugs

None.  But we haven't really tested much, so if you find anything, let us know and we'll fix it and update the repo. my email is [Matthew Giem](matthew.giem@gmail.com)

## Support and contact details

Come by during class if you have questions. or email [Matthew Giem](matthew.giem@gmail.com)

## Technologies Used

* Bootstrap
* Ruby
* Ruby Gems

### License

Licensed under the MIT License

Copyright (c) 2016 **Epicodus Ruby Project**
