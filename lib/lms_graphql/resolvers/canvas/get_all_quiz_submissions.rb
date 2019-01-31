require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class GetAllQuizSubmission < CanvasBaseResolver
        type Boolean, null: false
        argument :course_id, ID, required: true
        argument :quiz_id, ID, required: true
        argument :include, String, required: false
        def resolve(course_id:, quiz_id:, include: nil, get_all: false)
          result = context[:canvas_api].call("GET_ALL_QUIZ_SUBMISSIONS").proxy(
            "GET_ALL_QUIZ_SUBMISSIONS",
            {
              "course_id": course_id,
              "quiz_id": quiz_id,
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