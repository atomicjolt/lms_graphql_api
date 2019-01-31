require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/submission"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListAssignmentSubmissionsSection < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasSubmission], null: false
        argument :get_all, Boolean, required: false
        argument :section_id, ID, required: true
        argument :assignment_id, ID, required: true
        argument :include, String, required: false
        argument :grouped, Boolean, required: false
        def resolve(section_id:, assignment_id:, include: nil, grouped: nil, get_all: false)
          result = context[:canvas_api].call("LIST_ASSIGNMENT_SUBMISSIONS_SECTIONS").proxy(
            "LIST_ASSIGNMENT_SUBMISSIONS_SECTIONS",
            {
              "section_id": section_id,
              "assignment_id": assignment_id,
              "include": include,
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