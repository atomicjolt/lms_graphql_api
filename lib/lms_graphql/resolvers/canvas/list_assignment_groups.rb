require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/assignment_group"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListAssignmentGroup < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasAssignmentGroup], null: false
        argument :get_all, Boolean, required: false
        argument :course_id, ID, required: true
        argument :include, String, required: false
        argument :assignment_ids, [ID], required: false
        argument :exclude_assignment_submission_types, String, required: false
        argument :override_assignment_dates, Boolean, required: false
        argument :grading_period_id, ID, required: false
        argument :scope_assignments_to_student, Boolean, required: false
        def resolve(course_id:, include: nil, assignment_ids: nil, exclude_assignment_submission_types: nil, override_assignment_dates: nil, grading_period_id: nil, scope_assignments_to_student: nil, get_all: false)
          result = context[:canvas_api].call("LIST_ASSIGNMENT_GROUPS").proxy(
            "LIST_ASSIGNMENT_GROUPS",
            {
              "course_id": course_id,
              "include": include,
              "assignment_ids": assignment_ids,
              "exclude_assignment_submission_types": exclude_assignment_submission_types,
              "override_assignment_dates": override_assignment_dates,
              "grading_period_id": grading_period_id,
              "scope_assignments_to_student": scope_assignments_to_student            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end