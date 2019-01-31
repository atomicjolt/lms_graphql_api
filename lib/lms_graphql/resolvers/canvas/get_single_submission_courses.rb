require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSingleSubmissionCourse < CanvasBaseResolver
        type Boolean, null: false
        argument :course_id, ID, required: true
        argument :assignment_id, ID, required: true
        argument :user_id, ID, required: true
        argument :include, String, required: false
        def resolve(course_id:, assignment_id:, user_id:, include: nil, get_all: false)
          result = context[:canvas_api].call("GET_SINGLE_SUBMISSION_COURSES").proxy(
            "GET_SINGLE_SUBMISSION_COURSES",
            {
              "course_id": course_id,
              "assignment_id": assignment_id,
              "user_id": user_id,
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