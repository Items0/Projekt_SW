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
		@myObj = ActiveSupport::JSON.decode(json)
	end
end