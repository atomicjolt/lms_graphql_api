require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSingleSubmissionByAnonymousIdCourse < CanvasBaseResolver
        type Boolean, null: false
        argument :course_id, ID, required: true
        argument :assignment_id, ID, required: true
        argument :anonymous_id, ID, required: true
        argument :include, [String], required: false
        def resolve(course_id:, assignment_id:, anonymous_id:, include: nil, get_all: false)
          result = context[:canvas_api].call("GET_SINGLE_SUBMISSION_BY_ANONYMOUS_ID_COURSES").proxy(
            "GET_SINGLE_SUBMISSION_BY_ANONYMOUS_ID_COURSES",
            {
              "course_id": course_id,
              "assignment_id": assignment_id,
              "anonymous_id": anonymous_id,
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