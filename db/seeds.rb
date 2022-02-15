puts "Clearing the Lost Pet Database"
Pet.destroy_all

puts "Generating Pokemon"
50.times do
  temp_pet = Pet.create( name: Faker::Creature::Dog.name,
                  address: Faker::Address.street_address,
                  species: PET::SPECIES.sample,
                  found_on: Date.today - rand(1..21)),
                  age: rand(1..10)
  puts "Generated #{temp_pet.name}"
end

puts "Generated #{Pet.count} pets"
