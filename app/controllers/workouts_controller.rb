class WorkoutsController < ApplicationController

	before_action :find_workout, only: [:show, :edit, :update, :destroy]
	def create
		@workout = Workout.new(workout_params)
		if @workout.save
			redirect_to @workout
		else
			render 'new'
		end
	end

	def destroy
		@workout.destroy
		redirect_to root_path
	end

	def index
		@workouts = Workout.all.order("date DESC")
	end

	def new
		@workout = Workout.new
	end

	def show
	end

	def update 
		if @workout.update(workout_params)
			redirect_to @workout
		else
			render 'edit'
		end
	end

	private

	def workout_params
		params.require(:workout).permit(:date, :workout, :mood, :length)
	end

	def find_workout
		@workout = Workout.find(params[:id])
	end
end
