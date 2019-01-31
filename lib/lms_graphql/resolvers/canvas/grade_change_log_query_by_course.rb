require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/grade_change_event"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GradeChangeLogQueryByCourse < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasGradeChangeEvent], null: false
        argument :get_all, Boolean, required: false
        argument :course_id, ID, required: true
        argument :start_time, LMSGraphQL::Types::DateTimeType, required: false
        argument :end_time, LMSGraphQL::Types::DateTimeType, required: false
        def resolve(course_id:, start_time: nil, end_time: nil, get_all: false)
          result = context[:canvas_api].call("GRADE_CHANGE_LOG_QUERY_BY_COURSE").proxy(
            "GRADE_CHANGE_LOG_QUERY_BY_COURSE",
            {
              "course_id": course_id,
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