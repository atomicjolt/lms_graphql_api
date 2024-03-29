require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class ListSubmissionsForMultipleAssignmentsSection < CanvasBaseResolver
        type Boolean, null: false
        argument :section_id, ID, required: true
        argument :student_ids, [ID], required: false
        argument :assignment_ids, [ID], required: false
        argument :grouped, Boolean, required: false
        argument :post_to_sis, Boolean, required: false
        argument :submitted_since, GraphQL::Types::ISO8601DateTime, required: false
        argument :graded_since, GraphQL::Types::ISO8601DateTime, required: false
        argument :grading_period_id, ID, required: false
        argument :workflow_state, String, required: false
        argument :enrollment_state, String, required: false
        argument :state_based_on_date, Boolean, required: false
        argument :order, String, required: false
        argument :order_direction, String, required: false
        argument :include, [String], required: false
        def resolve(section_id:, student_ids: nil, assignment_ids: nil, grouped: nil, post_to_sis: nil, submitted_since: nil, graded_since: nil, grading_period_id: nil, workflow_state: nil, enrollment_state: nil, state_based_on_date: nil, order: nil, order_direction: nil, include: nil, get_all: false)
          result = context[:canvas_api].call("LIST_SUBMISSIONS_FOR_MULTIPLE_ASSIGNMENTS_SECTIONS").proxy(
            "LIST_SUBMISSIONS_FOR_MULTIPLE_ASSIGNMENTS_SECTIONS",
            {
              "section_id": section_id,
              "student_ids": student_ids,
              "assignment_ids": assignment_ids,
              "grouped": grouped,
              "post_to_sis": post_to_sis,
              "submitted_since": submitted_since,
              "graded_since": graded_since,
              "grading_period_id": grading_period_id,
              "workflow_state": workflow_state,
              "enrollment_state": enrollment_state,
              "state_based_on_date": state_based_on_date,
              "order": order,
              "order_direction": order_direction,
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