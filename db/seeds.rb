# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.destroy_all

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

2.times do
    Admin.create(name: Faker::Name.name)
end

10.times do
    percentage_profit = rand(30..90)
    profit_amount = rand(7500..20000)
    admin_id = rand(1..2)
    Collaborator.create(name: Faker::Name.name,
                        email: Faker::Internet.email,
                        phone_number: Faker::Number.number(digits: 9),
                        percentage_profit: percentage_profit,
                        profit_amount: profit_amount,
                        admin_id: admin_id,
                        )
end

40.times do
    admin_id = rand(1..2)
    collaborator_id = rand(1..10)
    Client.create(name: Faker::Name.name, 
                  rut: Faker::ChileRut.rut,  
                  phone_number: Faker::Number.number(digits: 9),
                  paid_out: 0,
                  collaborator_id: collaborator_id
                  )
end

35.times do
    paid_out = rand(1000..60000)
    admin_id = rand(1..2)
    collaborator_id = rand(1..10)
    Client.create(name: Faker::Name.name, 
                  rut: Faker::ChileRut.rut,  
                  phone_number: Faker::Number.number(digits: 9),
                  paid_out: paid_out,
                  collaborator_id: collaborator_id
                )
end

10.times do
    amount = rand(15000..30000)
    collaborator_id = rand(1..10)
    client_id = rand(1..25)
    Service.create(name: Faker::Company.industry,
                   amount: amount,
                   collaborator_id: collaborator_id,
                   client_id: client_id
                )
end


