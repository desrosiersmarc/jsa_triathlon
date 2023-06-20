class TestsController < ApplicationController
  before_action :office_mailing_list, only: [:create]

  def index
    @tests = Test.all
    @workout = Workout.first

    @workouts =[]
    # count maximum number of workouts for a day
    # Select all workout for a day
    WeekDay.all.each do |day|
      @workouts << Workout.where(week_day_id: day.id-1).sort_by{|workout| workout.start_hour}
    end
    # Sort them

    # add them in an array
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to tests_path
      send_test_email
    else
      render :new
    end
  end

  private
    def test_params
      params.require(:test).permit(:name)
    end

    def send_test_email
      UserTestMailer.email_test(@mails).deliver_later
    end

    def office_mailing_list
      @mails = User.where(notification: true)
                   .where(role: 'admin')
                   .map{|user| user.email}.join(';')
    end

end
