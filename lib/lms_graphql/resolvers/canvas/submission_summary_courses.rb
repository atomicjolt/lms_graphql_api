require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class SubmissionSummaryCourse < CanvasBaseResolver
        type Boolean, null: false
        argument :course_id, ID, required: true
        argument :assignment_id, ID, required: true
        argument :grouped, Boolean, required: false
        def resolve(course_id:, assignment_id:, grouped: nil, get_all: false)
          result = context[:canvas_api].call("SUBMISSION_SUMMARY_COURSES").proxy(
            "SUBMISSION_SUMMARY_COURSES",
            {
              "course_id": course_id,
              "assignment_id": assignment_id,
              "grouped": grouped            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end