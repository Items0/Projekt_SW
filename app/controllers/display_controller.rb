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
	end
	
	def insert
		puts("Start")
		puts(JSON.parse(params[:longitude]))
		puts("End")

		@myJSON = JSON.parse(request.raw_post)
		@username = @myJSON['username']
		@trainingID = @myJSON['trainingID']
		@longitude = @myJSON['longitude']
		@latitude = @myJSON['latitude']
		@myMiliSeconds = @myJSON['time']
		@myDate = Time.strptime(@myMiliSeconds.to_s, '%Q')
		Measurement.create(username: @username, trainingID: @trainingID, longitude: @longitude, latitude: @latitude, myDate: @myDate)	
		render plain: "Inserted correctly\n"
	end

	def savebyget
		#get 'saveme/user/:username/training/:trainingid/longitude/:longitude/latitude/:latitude/time/:time
		@username = params[:username]
		@trainingID = params[:trainingid]
		@longitude = params[:longitude]
		@latitude = params[:latitude]
		@myMiliSeconds = params[:time]
		@myDate = Time.strptime(@myMiliSeconds.to_s, '%Q')
		Measurement.create(username: @username, trainingID: @trainingID, longitude: @longitude, latitude: @latitude, myDate: @myDate)	
		render plain: "OK"
	end
end