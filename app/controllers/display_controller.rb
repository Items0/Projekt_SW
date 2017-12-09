class DisplayController < ApplicationController
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@measurements = Measurement.where(user_id: params[:id])
		@types = @measurements.pluck('distinct kind')
	end
end