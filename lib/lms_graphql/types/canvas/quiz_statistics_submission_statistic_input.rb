require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasQuizStatisticsSubmissionStatisticInput < BaseInputObject
        description "Quiz Statistics. API Docs: https://canvas.instructure.com/doc/api/quiz_statistics.html"
      	argument :unique_count, Int, "The number of students who have taken the quiz..Example: 3", required: false
      	argument :score_average, Float, "The mean of the student submission scores..Example: 4.33333333333333", required: false
      	argument :score_high, Float, "The highest submission score..Example: 6", required: false
      	argument :score_low, Float, "The lowest submission score..Example: 3", required: false
      	argument :score_stdev, Float, "Standard deviation of the submission scores..Example: 1.24721912892465", required: false
      	argument :scores, String, "A percentile distribution of the student scores, each key is the percentile (ranges between 0 and 100%) while the value is the number of students who received that score..Example: 1, 5, 1", required: false
      	argument :correct_count_average, Float, "The mean of the number of questions answered correctly by each student..Example: 3.66666666666667", required: false
      	argument :incorrect_count_average, Float, "The mean of the number of questions answered incorrectly by each student..Example: 5", required: false
      	argument :duration_average, Float, "The average time spent by students while taking the quiz..Example: 42.333333333", required: false

      end
    end
  end
end