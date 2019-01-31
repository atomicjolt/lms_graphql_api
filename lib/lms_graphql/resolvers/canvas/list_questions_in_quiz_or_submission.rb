require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/quiz_question"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListQuestionsInQuizOrSubmission < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasQuizQuestion], null: false
        argument :get_all, Boolean, required: false
        argument :course_id, ID, required: true
        argument :quiz_id, ID, required: true
        argument :quiz_submission_id, ID, required: false
        argument :quiz_submission_attempt, Int, required: false
        def resolve(course_id:, quiz_id:, quiz_submission_id: nil, quiz_submission_attempt: nil, get_all: false)
          result = context[:canvas_api].call("LIST_QUESTIONS_IN_QUIZ_OR_SUBMISSION").proxy(
            "LIST_QUESTIONS_IN_QUIZ_OR_SUBMISSION",
            {
              "course_id": course_id,
              "quiz_id": quiz_id,
              "quiz_submission_id": quiz_submission_id,
              "quiz_submission_attempt": quiz_submission_attempt            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end