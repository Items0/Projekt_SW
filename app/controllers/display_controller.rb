class DisplayController < ApplicationController
	def index
		@myUsers = Measurement.distinct.pluck(:username)
	end

	def showuser
		@user = params[:username]
		@trainings = Measurement.where(username: @user).select(:trainingID, :myDate).group(:trainingID)
	end

	def showtraining
		@user = params[:username]
		@measurements = Measurement.where(username: @user, trainingID: params[:trainingid]).order(:myDate)

		@distance = [0]
		@speed = []
		@measurements.each_cons(2) do |pre, cur|
			distanceSample = Geocoder::Calculations.distance_between([pre.latitude, pre.longitude], [cur.latitude, cur.longitude])
			@distance.push(distanceSample + @distance.last)
			@speed.push(distanceSample * 3600 / (cur.myDate - pre.myDate) )
		end
		@altitude = @measurements.where.not(altitude: 0).pluck(:myDate, :altitude)
	end
	
	def insert
		#puts("Start")
		#puts(JSON.parse(request.raw_post))
		#puts("End")

		@myJSON = JSON.parse(request.raw_post)

		@username = @myJSON['username']
		@trainingID = @myJSON['trainingID']
		@longitude = @myJSON['longitude']
		@latitude = @myJSON['latitude']
		@altitude = @myJSON['altitude']
		@myMiliSeconds = @myJSON['time']
		#@myDate = Time.strptime((@myMiliSeconds.to_f + 3600 * 1000).to_s, '%Q')
		@myDate = Time.strptime((@myMiliSeconds).to_s, '%Q')
		Measurement.create(username: @username, trainingID: @trainingID, longitude: @longitude, latitude: @latitude, altitude: @altitude, myDate: @myDate)	
		render plain: "Inserted correctly\n"
	end

	def savebyget
		#get 'saveme/user/:username/training/:trainingid/longitude/:longitude/latitude/:latitude/altitude/:altitude/time/:time
		@username = params[:username]
		@trainingID = params[:trainingid]
		@longitude = params[:longitude]
		@latitude = params[:latitude]
		@altitude = params[:altitude]
		@myMiliSeconds = params[:time]
		@myDate = Time.strptime(@myMiliSeconds.to_s, '%Q')
		Measurement.create(username: @username, trainingID: @trainingID, longitude: @longitude, latitude: @latitude, altitude: @altitude, myDate: @myDate)	
		render plain: "OK"
	end
end