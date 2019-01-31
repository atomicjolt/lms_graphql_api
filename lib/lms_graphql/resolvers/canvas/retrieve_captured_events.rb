require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class RetrieveCapturedEvent < CanvasBaseResolver
        type Boolean, null: false
        argument :course_id, ID, required: true
        argument :quiz_id, ID, required: true
        argument :id, ID, required: true
        argument :attempt, Int, required: false
        def resolve(course_id:, quiz_id:, id:, attempt: nil, get_all: false)
          result = context[:canvas_api].call("RETRIEVE_CAPTURED_EVENTS").proxy(
            "RETRIEVE_CAPTURED_EVENTS",
            {
              "course_id": course_id,
              "quiz_id": quiz_id,
              "id": id,
              "attempt": attempt            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end