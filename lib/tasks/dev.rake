namespace :dev do
  desc "Configurando dados de teste desenvolvimento"
  task setup: :environment do
    r1= Drive.create!(name: "Centro")
    r2= Drive.create!(name: "Dirceu")
    op = r1
    count = 1
    20.times do |i|
      c =  Client.create!(
        name: Faker::Name.name,
        cpf: Faker::Number.number(11),
        rg: Faker::Number.number(8),
        phone1: Faker::PhoneNumber.cell_phone,
        phone2: Faker::PhoneNumber.cell_phone,
        street: Faker::Address.street_name,
        number: Faker::Address.building_number,
        district: Faker::Address.community,
        city: Faker::Address.city,
        drive: op
      )

      10.times do |i|
        b = Bill.create!(
          value: Faker::Number.decimal(3),
          note: Faker::Lorem.sentence(10),
          status: :active,
          date: Faker::Date.between(Date.today, Date.today),
          client: c
        )
        p = Payment.create!(
          value: Faker::Number.decimal(2),
          date: Faker::Date.forward(31),
          bill: b
        )
        p = Payment.create!(
          value: Faker::Number.decimal(2),
          date: Faker::Date.forward(61),
          bill: b
        )
        p = Payment.create!(
          value: Faker::Number.decimal(2),
          date: Faker::Date.forward(92),
          bill: b
        )
        op = r2 if (count >10)
        count +=1
      end
    end
  end
end
