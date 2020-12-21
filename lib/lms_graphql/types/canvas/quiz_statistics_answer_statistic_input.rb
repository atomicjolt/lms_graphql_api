require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasQuizStatisticsAnswerStatisticInput < BaseInputObject
        description "Quiz Statistics. API Docs: https://canvas.instructure.com/doc/api/quiz_statistics.html"
      	argument :id, ID, "ID of the answer..Example: 3866", required: false
      	argument :text, String, "The text attached to the answer..Example: Blue.", required: false
      	argument :weight, Int, "An integer to determine correctness of the answer. Incorrect answers should be 0, correct answers should be non-negative..Example: 100", required: false
      	argument :responses, Int, "Number of students who have chosen this answer..Example: 2", required: false

      end
    end
  end
end