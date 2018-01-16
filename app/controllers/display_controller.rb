class DisplayController < ApplicationController
	def index
		@users = User.all
	end

	def showuser
		@user = User.find(params[:userid])
		@trainings = Measurement.where(user_id: @user.id).select(:training_id, :created_at).group(:training_id)
	end

	def showtraining
		@user = User.find(params[:userid])
		@measurements = Measurement.where(user_id: @user.id, training_id: params[:trainingid])
		@types = @measurements.pluck('distinct kind')
	end
end