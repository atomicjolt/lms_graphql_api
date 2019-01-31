require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/submission_version"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListUncollatedSubmissionVersion < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasSubmissionVersion], null: false
        argument :get_all, Boolean, required: false
        argument :course_id, ID, required: true
        argument :assignment_id, ID, required: false
        argument :user_id, ID, required: false
        argument :ascending, Boolean, required: false
        def resolve(course_id:, assignment_id: nil, user_id: nil, ascending: nil, get_all: false)
          result = context[:canvas_api].call("LIST_UNCOLLATED_SUBMISSION_VERSIONS").proxy(
            "LIST_UNCOLLATED_SUBMISSION_VERSIONS",
            {
              "course_id": course_id,
              "assignment_id": assignment_id,
              "user_id": user_id,
              "ascending": ascending            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end