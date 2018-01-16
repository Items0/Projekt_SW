# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(name: 'Items', password_digest: BCrypt::Password.create('mypass'))
u2 = User.create(name: 'Jarkendar', password_digest: BCrypt::Password.create('mypass2'))

@kind_type = ['vertical', 'horizontal', 'acceleration']

@training_user1 = 1
@training_user2 = 1
Random.new_seed
30.times do
	if rand(2) == 0
		100.times do |x|
			@myRand= rand(3)
			@myKind = @kind_type[@myRand]
			@myValue = -100 + rand(300)
			Measurement.create(user_id: 1, training_id: @training_user1, kind: @myKind, value: @myValue)
		end
		@training_user1 += 1
	else
		100.times do |x|
			@myRand= rand(3)
			@myKind = @kind_type[@myRand]
			@myValue = -100 + rand(300)
			Measurement.create(user_id: 2, training_id: @training_user2, kind: @myKind, value: @myValue) 
		end
		@training_user2 += 1
	end
end
#u1.measurements << [m1]





#u1.measurements << [m1, m2, m3, m4, m5, m6, m7, m8, m9, m10]
#u2.measurements << [m11, m12, m13, m14, m15, m16, m17, m18, m19, m20]
