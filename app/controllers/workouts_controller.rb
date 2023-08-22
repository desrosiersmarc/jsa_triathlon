class WorkoutsController < ApplicationController
    before_action :find_workout, only: [:show, :edit, :update]

    def index
        @workouts = Workout.all.sort_by{|workout| workout.week_day_id}
    end

    def show
    end

    def edit
        @locations = Location.all
        @week_days = WeekDay.all
        @sport_types = SportType.all
    end

    def update
        @workout.update(workout_params)
        if @workout.save
            redirect_to workouts_path
        else
            render :edit
        end
    end
private
    def find_workout
        @workout=Workout.find(params[:id])
    end

    def workout_params 
        params.require(:workout).permit(
            :name,
            :start_hour,
            :end_hour,
            :location_id,
            :week_day_id,
            :sport_type_id
        )
        
    end
end
