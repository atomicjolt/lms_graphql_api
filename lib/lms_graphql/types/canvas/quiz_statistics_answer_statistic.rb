require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasQuizStatisticsAnswerStatistic < BaseType
          description "Quiz Statistics. API Docs: https://canvas.instructure.com/doc/api/quiz_statistics.html"
        field :id, ID, "ID of the answer..Example: 3866", null: true
        field :text, String, "The text attached to the answer..Example: Blue.", null: true
        field :weight, Int, "An integer to determine correctness of the answer. Incorrect answers should be 0, correct answers should 100.Example: 100", null: true
        field :responses, Int, "Number of students who have chosen this answer..Example: 2", null: true

      end
    end
  end
end