require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasQuizStatisticsAnswerPointBiserialInput < BaseInputObject
        description "Quiz Statistics. API Docs: https://canvas.instructure.com/doc/api/quiz_statistics.html"
      	argument :answer_id, ID, "ID of the answer the point biserial is for..Example: 3866", required: false
      	argument :point_biserial, Float, "The point biserial value for this answer. Value ranges between -1 and 1..Example: -0.802955068546966", required: false
      	argument :correct, Boolean, "Convenience attribute that denotes whether this is the correct answer as opposed to being a distractor. This is mutually exclusive with the `distractor` value.Example: true", required: false
      	argument :distractor, Boolean, "Convenience attribute that denotes whether this is a distractor answer and not the correct one. This is mutually exclusive with the `correct` value.", required: false

      end
    end
  end
end