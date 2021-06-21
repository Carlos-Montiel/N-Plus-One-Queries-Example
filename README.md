# N+1 Queries example 

Simple restaurant directory app to demonstrate problem of N+1 queries on ruby on rails active record.

It consists of 5 tables related with each other, one called Owners (restaurant owners) another called Restaurants, and finally 3 tables that correspond to the restaurant addresses called States, Municipalities and ZipCodes which are related as follow:
- State
  - has many municipalities
- Municipality
  - belongs to state
  - has many zip codes
- ZipCode
  - belongs to municipality
  - has many restaurants
- Restaurant
  - belongs to zip code
  - belongs to owner
- Owner
  - has many restaurants

See database structure on the diagram of this this [link](https://dbdiagram.io/d/60cfe50e0c1ff875fcd5a8f1).

Details and dependences:

* Ruby version 3.0.0
* Rails version 6.1.3.2
* PostgreSQL as database management system
* Rspec as testing framework using [rspec-rails gem](https://github.com/rspec/rspec-rails)
* [faker gem](https://github.com/faker-ruby/faker) to generate simulated data on the models
* [haml](https://github.com/haml/haml) and [haml-rails gem](https://github.com/haml/haml-rails) to enable Haml as the templating engine on the app

## Installing
After cloning the repository just run in console:
```bash
bundle install
rails db:setup
```
With this, you have installed needed dependences, prepared the database and created some states, municipaliies, zip_codes, owners and restaurant records, Now it's ready to use!

## Using
You can find the N+1 Query problem on restaurants index view, where is showed a table containing all existing restaurants on the app database. The fields showed are owner's name obtained through the owner's relation, restaurant's name, type and description which are fields on the table restaurants, state name obtained through zip_code -> municipality -> state relation, municipality's name obtained through zip_code -> municipality relation, and zip code name obtained through zip_code relation.

You can see in the app log that each time in the loop through @restaurants, are executed four extra queries to the restaurant's principal one 
(owner, state, municipality and zip_code) so if you have nine restaurants you'll ended up with 36 extra requests to database, and it will increase with each new restaurant added.

You can use this app to illustrate the problem and also show a solution.

## Seeding
To illustrate better you can run the following task:
```bash
rails db:seed:add_restaurants
```
It will create 100 owner records and 3 restaurants for each one (300 restaurants).

## Testing
To run tests just type:
```bash
rspec
```
It covers models test (relations and some validations), and view test on owners and restaurants index. 
