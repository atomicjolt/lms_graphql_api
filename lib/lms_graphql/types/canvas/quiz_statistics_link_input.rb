require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasQuizStatisticsLinkInput < BaseInputObject
        description "Quiz Statistics. API Docs: https://canvas.instructure.com/doc/api/quiz_statistics.html"
      argument :quiz, String, "HTTP/HTTPS API URL to the quiz this statistics describe..Example: http://canvas.example.edu/api/v1/courses/1/quizzes/2", required: false

      end
    end
  end
end