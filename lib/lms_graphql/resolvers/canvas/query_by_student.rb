require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/grade_change_event"
module LMSGraphQL
  module Resolvers
    module Canvas
      class QueryByStudent < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasGradeChangeEvent], null: false
        argument :student_id, ID, required: true
        argument :start_time, LMSGraphQL::Types::DateTimeType, required: false
        argument :end_time, LMSGraphQL::Types::DateTimeType, required: false
        def resolve(student_id:, start_time: nil, end_time: nil)
          context[:canvas_api].call("QUERY_BY_STUDENT").proxy(
            "QUERY_BY_STUDENT",
            {
              "student_id": student_id,
              "start_time": start_time,
              "end_time": end_time            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end