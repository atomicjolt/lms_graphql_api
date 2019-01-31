require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/course"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListCoursesForUser < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasCourse], null: false
        argument :get_all, Boolean, required: false
        argument :user_id, ID, required: true
        argument :include, String, required: false
        argument :state, String, required: false
        argument :enrollment_state, String, required: false
        def resolve(user_id:, include: nil, state: nil, enrollment_state: nil, get_all: false)
          result = context[:canvas_api].call("LIST_COURSES_FOR_USER").proxy(
            "LIST_COURSES_FOR_USER",
            {
              "user_id": user_id,
              "include": include,
              "state": state,
              "enrollment_state": enrollment_state            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end