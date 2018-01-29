# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Random.new_seed
@training_user1 = @training_user2 = 1
30.times do
	if rand(2) == 0
		100.times do |x|
			@exampleLongtitude = -100 + rand(300)
			@exampleLatitude = -100 + rand(300)
			Measurement.create(username: "Items", trainingID: @training_user1, longtitude: @exampleLongtitude, latitude: @exampleLatitude, myDate: rand(10.hours).seconds.ago)
		end
		@training_user1 += 1
	else
		100.times do |x|
			@exampleLongtitude = -100 + rand(300)
			@exampleLatitude = -100 + rand(300)
			Measurement.create(username: "Jarkendar", trainingID: @training_user2, longtitude: @exampleLongtitude, latitude: @exampleLatitude, myDate: rand(10.hours).seconds.ago)
		end
		@training_user2 += 1
	end
end

