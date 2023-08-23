class WorkoutsController < ApplicationController
    before_action :find_workout, only: [:edit, :update, :destroy]

    def new
        @workout = Workout.new
        @locations = Location.all
        @week_days = WeekDay.all
        @sport_types = SportType.all
    end
    
    def create
        @workout = Workout.new(workout_params)
        if @workout.save
            redirect_to trainings_path
        else
            render :new
        end
    end 

    def edit
        @locations = Location.all
        @week_days = WeekDay.all
        @sport_types = SportType.all
    end

    def update
        @workout.update(workout_params)
        if @workout.save
            redirect_to trainings_path
        else
            render :edit
        end
    end

    def destroy
        @workout.destroy
        redirect_to trainings_path
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
