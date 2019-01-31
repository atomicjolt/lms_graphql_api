require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class GetEffectiveDueDate < CanvasBaseResolver
        type Boolean, null: false
        argument :course_id, ID, required: true
        argument :assignment_ids, [ID], required: false
        def resolve(course_id:, assignment_ids: nil, get_all: false)
          result = context[:canvas_api].call("GET_EFFECTIVE_DUE_DATES").proxy(
            "GET_EFFECTIVE_DUE_DATES",
            {
              "course_id": course_id,
              "assignment_ids": assignment_ids            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end