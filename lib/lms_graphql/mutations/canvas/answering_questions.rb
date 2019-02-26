require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/quiz_submission_question"
module LMSGraphQL
  module Mutations
    module Canvas
      class AnsweringQuestion < BaseMutation
        argument :quiz_submission_id, ID, required: true
        argument :attempt, Int, required: true
        argument :validation_token, String, required: true
        argument :access_code, String, required: false
        argument :quiz_questions, [LMSGraphQL::Types::Canvas::CanvasQuizSubmissionQuestionInput], required: false
        field :quiz_submission_question, [LMSGraphQL::Types::Canvas::CanvasQuizSubmissionQuestion], null: false
        def resolve(quiz_submission_id:, attempt:, validation_token:, access_code: nil, quiz_questions: nil)
          context[:canvas_api].call("ANSWERING_QUESTIONS").proxy(
            "ANSWERING_QUESTIONS",
            {
              "quiz_submission_id": quiz_submission_id
            },
            {
              "attempt": attempt,
              "validation_token": validation_token,
              "access_code": access_code,
              "quiz_questions": quiz_questions
            },
          ).parsed_response
        end
      end
    end
  end
end