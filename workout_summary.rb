require_relative 'workout'
require 'csv'
require 'pry'
require 'table_print'

def load_workout_data(filename)
  workouts = {}

  CSV.foreach(filename, headers: true, header_converters: :symbol, converters: :numeric) do |row|
    workout_id = row[:workout_id]

    if !workouts[workout_id]
      workouts[workout_id] = {
        date: row[:date],
        exercises: []
      }
    end

    exercise = {
      name: row[:exercise],
      category: row[:category],
      duration_in_min: row[:duration_in_min],
      intensity: row[:intensity]
    }

    workouts[workout_id][:exercises] << exercise
  end
  workouts
end

workouts = load_workout_data('workouts.csv')
all_workouts = []
workouts.each do |key, value|
  workout_id = key
  date = value[:date]
  exercises = value[:exercises]
  workout1 = Workout.new(workout_id,exercises, date)
  all_workouts << workout1
end

tp all_workouts,[:workout_id, :date, :type, :calories_burned, :duration,]

