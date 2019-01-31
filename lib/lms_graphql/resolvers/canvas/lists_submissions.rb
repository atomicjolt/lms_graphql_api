require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/submission_history"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListsSubmission < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasSubmissionHistory], null: false
        argument :get_all, Boolean, required: false
        argument :course_id, ID, required: true
        argument :date, String, required: true
        argument :grader_id, ID, required: true
        argument :assignment_id, ID, required: true
        def resolve(course_id:, date:, grader_id:, assignment_id:, get_all: false)
          result = context[:canvas_api].call("LISTS_SUBMISSIONS").proxy(
            "LISTS_SUBMISSIONS",
            {
              "course_id": course_id,
              "date": date,
              "grader_id": grader_id,
              "assignment_id": assignment_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end