require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class GetFormattedStudentNumericalAnswer < CanvasBaseResolver
        type Boolean, null: false
        argument :quiz_submission_id, ID, required: true
        argument :id, ID, required: true
        argument :answer, String, required: true
        def resolve(quiz_submission_id:, id:, answer:, get_all: false)
          result = context[:canvas_api].call("GET_FORMATTED_STUDENT_NUMERICAL_ANSWER").proxy(
            "GET_FORMATTED_STUDENT_NUMERICAL_ANSWER",
            {
              "quiz_submission_id": quiz_submission_id,
              "id": id,
              "answer": answer            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end