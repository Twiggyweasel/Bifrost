# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

index = 1
user_index = 1
10.times do 
    Client.create(name: Faker::Company.name, street: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, zipcode: "66215", status: 0, service_type: 0, payment_method: 0, ein: Faker::Company.ein, industry: Faker::Company.industry, logo: Faker::Company.logo)
    10.times do
        if user_index == 1
        User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, primary_phone: Faker::PhoneNumber.phone_number, client: Client.find(index), is_primary: true)
        else 
        User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, primary_phone: Faker::PhoneNumber.phone_number, client: Client.find(index), is_primary: false)
        end
    end
    user_index = 1
    index += 1
end

100.times do
    client_record = Client.find(rand(1..10))    
    user_record = client_record.users[rand(1..10)]
    Ticket.create(request_summary: Faker::Kpop.iii_groups, request_detail: Faker::Lorem.sentence(30, true), severity: rand(0..3), status: rand(0..2), client: client_record, user: user_record)
end

Ticket.all.each do |t|
    t.comments.create(body: Faker::Lorem.sentence(45, true), user: User.find(rand(1..100)), commentable: Ticket.find(rand(1..10)))
end