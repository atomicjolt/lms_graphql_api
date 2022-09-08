require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/grade_change_event"
module LMSGraphQL
  module Resolvers
    module Canvas
      class AdvancedQuery < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasGradeChangeEvent], null: false
        argument :get_all, Boolean, required: false
        argument :course_id, ID, required: false
        argument :assignment_id, ID, required: false
        argument :student_id, ID, required: false
        argument :grader_id, ID, required: false
        argument :start_time, GraphQL::Types::ISO8601DateTime, required: false
        argument :end_time, GraphQL::Types::ISO8601DateTime, required: false
        def resolve(course_id: nil, assignment_id: nil, student_id: nil, grader_id: nil, start_time: nil, end_time: nil, get_all: false)
          result = context[:canvas_api].call("ADVANCED_QUERY").proxy(
            "ADVANCED_QUERY",
            {
              "course_id": course_id,
              "assignment_id": assignment_id,
              "student_id": student_id,
              "grader_id": grader_id,
              "start_time": start_time,
              "end_time": end_time            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end