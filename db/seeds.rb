# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Random.new_seed
@training_user1 = @training_user2 = 1
20.times do
	if rand(2) == 0
		100.times do |x|
			@examplelongitude = rand(38)
			@exampleLatitude =  rand(100)
			Measurement.create(username: "Items", trainingID: @training_user1, longitude: @examplelongitude, latitude: @exampleLatitude, myDate: rand(1.hours).seconds.ago)
		end
		@training_user1 += 1
	else
		100.times do |x|
			@examplelongitude = rand(38)
			@exampleLatitude = rand(100)
			Measurement.create(username: "Jarkendar", trainingID: @training_user2, longitude: @examplelongitude, latitude: @exampleLatitude, myDate: rand(1.hours).seconds.ago)
		end
		@training_user2 += 1
	end
end

