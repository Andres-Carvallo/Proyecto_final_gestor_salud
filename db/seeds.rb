# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.destroy_all
Collaborator.destroy_all
Client.destroy_all
Admin.destroy_all
Service.destroy_all

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

2.times do
    Admin.create!(name: Faker::Name.name)
end

10.times do
    percentage_profit = rand(30..90)
    rand_value = rand(0..1)
    admin_id = rand(1..2)
    Collaborator.create!(name: Faker::Name.name,
                        phone_number: Faker::Number.number(digits: 9),
                        percentage_profit: percentage_profit,
                        profit_amount: 0,
                        admin_id: Admin.last(2)[rand_value].id,
                        created_at: Faker::Date.between(from: '2020-12-01', to: '2021-1-31'),
                        )
end

10.times do
    
    profit_amount = rand(7500..20000)
    rand_value = rand(0..1)
    Collaborator.create!(name: Faker::Name.name,
                        phone_number: Faker::Number.number(digits: 9),
                        percentage_profit: 0,
                        profit_amount: profit_amount,
                        admin_id: Admin.last(2)[rand_value].id,
                        created_at: Faker::Date.between(from: '2020-12-01', to: '2021-1-31'),
                        )
end

40.times do
    
    rand_value = rand(0..19)
    Client.create!(name: Faker::Name.name, 
                  rut: Faker::ChileRut.rut,  
                  phone_number: Faker::Number.number(digits: 9),
                  paid_out: 0,
                  collaborator_id: Collaborator.last(20)[rand_value].id,
                  created_at: Faker::Date.between(from: '2020-12-01', to: '2021-1-31'),
                  )
end

35.times do
    paid_out = rand(1000..60000)
    rand_value = rand(0..19)
    Client.create!(name: Faker::Name.name, 
                  rut: Faker::ChileRut.rut,  
                  phone_number: Faker::Number.number(digits: 9),
                  paid_out: paid_out,
                  collaborator_id: Collaborator.last(20)[rand_value].id,
                  created_at: Faker::Date.between(from: '2020-12-01', to: '2021-1-31'),
                )
end

10.times do
    amount = rand(15000..30000)
    rand_value_colab = rand(0..19)
    rand_value_client = rand(0..74)
    sessions = rand(1..10)
    Service.create!(name: Faker::Company.industry,
                   amount: amount,
                   collaborator_id: Collaborator.last(20)[rand_value_colab].id,
                   client_id: Client.last(75)[rand_value_client].id,
                   session: sessions,
                   bill: (sessions * amount)
                )
end


