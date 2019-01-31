require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/assignment"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSingleAssignment < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasAssignment, null: false
        argument :course_id, ID, required: true
        argument :id, ID, required: true
        argument :include, String, required: false
        argument :override_assignment_dates, Boolean, required: false
        argument :needs_grading_count_by_section, Boolean, required: false
        argument :all_dates, Boolean, required: false
        def resolve(course_id:, id:, include: nil, override_assignment_dates: nil, needs_grading_count_by_section: nil, all_dates: nil, get_all: false)
          result = context[:canvas_api].call("GET_SINGLE_ASSIGNMENT").proxy(
            "GET_SINGLE_ASSIGNMENT",
            {
              "course_id": course_id,
              "id": id,
              "include": include,
              "override_assignment_dates": override_assignment_dates,
              "needs_grading_count_by_section": needs_grading_count_by_section,
              "all_dates": all_dates            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end