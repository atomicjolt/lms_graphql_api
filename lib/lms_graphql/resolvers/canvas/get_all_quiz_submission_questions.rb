require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class GetAllQuizSubmissionQuestion < CanvasBaseResolver
        type Boolean, null: false
        argument :quiz_submission_id, ID, required: true
        argument :include, String, required: false
        def resolve(quiz_submission_id:, include: nil, get_all: false)
          result = context[:canvas_api].call("GET_ALL_QUIZ_SUBMISSION_QUESTIONS").proxy(
            "GET_ALL_QUIZ_SUBMISSION_QUESTIONS",
            {
              "quiz_submission_id": quiz_submission_id,
              "include": include            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end