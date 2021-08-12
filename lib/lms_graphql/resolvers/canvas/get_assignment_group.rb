require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/assignment_group"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetAssignmentGroup < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasAssignmentGroup, null: false
        argument :course_id, ID, required: true
        argument :assignment_group_id, ID, required: true
        argument :include, [String], required: false
        argument :override_assignment_dates, Boolean, required: false
        argument :grading_period_id, ID, required: false
        def resolve(course_id:, assignment_group_id:, include: nil, override_assignment_dates: nil, grading_period_id: nil, get_all: false)
          result = context[:canvas_api].call("GET_ASSIGNMENT_GROUP").proxy(
            "GET_ASSIGNMENT_GROUP",
            {
              "course_id": course_id,
              "assignment_group_id": assignment_group_id,
              "include": include,
              "override_assignment_dates": override_assignment_dates,
              "grading_period_id": grading_period_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end