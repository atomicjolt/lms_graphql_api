require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class ListAssignmentsForUser < CanvasBaseResolver
        type Boolean, null: false
        argument :user_id, ID, required: true
        argument :course_id, ID, required: true
        def resolve(user_id:, course_id:, get_all: false)
          result = context[:canvas_api].call("LIST_ASSIGNMENTS_FOR_USER").proxy(
            "LIST_ASSIGNMENTS_FOR_USER",
            {
              "user_id": user_id,
              "course_id": course_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end