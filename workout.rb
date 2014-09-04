require 'pry'
require 'table_print'

class Workout
attr_accessor :exercises, :date, :workout_id
  def initialize(workout_id, exercises = [], date)
    @date = date
    @workout_id = workout_id
    @exercises = exercises
    end

  def type
    types = []
    @exercises.each do |exercise|
        types << exercise[:category]
         end
  cardio_count = types.count("cardio")
  strength_count = types.count("strength")
    if cardio_count > types.length/2
      type = "cardio"
    elsif strength_count > types.length/2
       type = "strength"
    else
      type = "other"
    end
  type
  end

 def calories_burned
    calories = 0.0

    @exercises.each do |exercise|
      if exercise[:category] == "cardio"
        if exercise[:intensity] == "high"
          calories += (exercise[:duration_in_min] * 10.0)
        elsif exercise[:intensity] == "medium"
          calories += (exercise[:duration_in_min] * 8.0)
        elsif exercise[:intensity] == "low"
          calories += (exercise[:duration_in_min] * 5.0)
        end
      else
        calories += exercise[:duration_in_min] * 6.0
      end
    end
    calories
  end

  def duration
    exercise_time = []
    @exercises.each do |exercise|
        exercise_time << exercise[:duration_in_min]
    end
  workout_time = exercise_time.inject(0){|result,element| result + element}
end
end





