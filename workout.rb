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
    result = 0
    @exercises.each do |exercise|
      if exercise[:intensity] == "high"
         result += 10
      end
      if exercise[:intensity] == "medium"
         result += 8
      end
      if exercise[:intensity] == "low"
          result += 5
       end
      if exercise[:intensity] == nil
        result += 6
      end
    end
    return result
  end

  def duration
    exercise_time = []
    @exercises.each do |exercise|
        exercise_time << exercise[:duration_in_min]
    end
  workout_time = exercise_time.inject(0){|result,element| result + element}
end
end





