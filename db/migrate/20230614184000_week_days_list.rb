class WeekDaysList < ActiveRecord::Migration[6.1]
  def change
    WeekDay.create(id:1, name:'Lundi')
    WeekDay.create(id:2, name:'Mardi')
    WeekDay.create(id:3, name:'Mercredi')
    WeekDay.create(id:4, name:'Jeudi')
    WeekDay.create(id:5, name:'Vendredi')
    WeekDay.create(id:6, name:'Samedi')
    WeekDay.create(id:7, name:'Dimanche')
  end
end
