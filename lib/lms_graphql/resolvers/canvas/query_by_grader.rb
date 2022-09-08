require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/grade_change_event"
module LMSGraphQL
  module Resolvers
    module Canvas
      class QueryByGrader < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasGradeChangeEvent], null: false
        argument :get_all, Boolean, required: false
        argument :grader_id, ID, required: true
        argument :start_time, GraphQL::Types::ISO8601DateTime, required: false
        argument :end_time, GraphQL::Types::ISO8601DateTime, required: false
        def resolve(grader_id:, start_time: nil, end_time: nil, get_all: false)
          result = context[:canvas_api].call("QUERY_BY_GRADER").proxy(
            "QUERY_BY_GRADER",
            {
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