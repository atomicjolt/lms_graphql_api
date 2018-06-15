require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/grade_change_event"
module LMSGraphQL
  module Resolvers
    module Canvas
      class QueryByAssignment < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::GradeChangeEvent], null: false
        argument :assignment_id, ID, required: true
        argument :start_time, LMSGraphQL::Types::DateTimeType, required: false
        argument :end_time, LMSGraphQL::Types::DateTimeType, required: false
        def resolve(assignment_id:, start_time: nil, end_time: nil)
          context[:canvas_api].proxy(
            "QUERY_BY_ASSIGNMENT",
            {
              "assignment_id": assignment_id,
              "start_time": start_time,
              "end_time": end_time            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end