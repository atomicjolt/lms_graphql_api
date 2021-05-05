require_relative "../canvas_base_input_type"
require_relative "quiz_statistics_answer_statistic"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasQuizStatisticsQuestionStatisticInput < BaseInputObject
          description "Quiz Statistics. API Docs: https://canvas.instructure.com/doc/api/quiz_statistics.html"
      argument :responses, Int, "Number of students who have provided an answer to this question. Blank or empty responses are not counted..Example: 3", required: false
      argument :answers, LMSGraphQL::Types::Canvas::CanvasQuizStatisticsAnswerStatisticInput, "Statistics related to each individual pre-defined answer..", required: false

      end
    end
  end
end