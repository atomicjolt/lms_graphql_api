require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class GetAvailableQuizIpFilter < CanvasBaseResolver
        type Boolean, null: false
        argument :course_id, ID, required: true
        argument :quiz_id, ID, required: true
        def resolve(course_id:, quiz_id:, get_all: false)
          result = context[:canvas_api].call("GET_AVAILABLE_QUIZ_IP_FILTERS").proxy(
            "GET_AVAILABLE_QUIZ_IP_FILTERS",
            {
              "course_id": course_id,
              "quiz_id": quiz_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end