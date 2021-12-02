require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class GetRubricCommentsReadStateCourse < CanvasBaseResolver
        type Boolean, null: false
        argument :course_id, ID, required: true
        argument :assignment_id, ID, required: true
        argument :user_id, ID, required: true
        def resolve(course_id:, assignment_id:, user_id:, get_all: false)
          result = context[:canvas_api].call("GET_RUBRIC_COMMENTS_READ_STATE_COURSES").proxy(
            "GET_RUBRIC_COMMENTS_READ_STATE_COURSES",
            {
              "course_id": course_id,
              "assignment_id": assignment_id,
              "user_id": user_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end