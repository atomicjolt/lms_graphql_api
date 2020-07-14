require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/course_event"
module LMSGraphQL
  module Resolvers
    module Canvas
      class CourseAuditLogQueryByAccount < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasCourseEvent], null: false
        argument :get_all, Boolean, required: false
        argument :account_id, ID, required: true
        argument :start_time, LMSGraphQL::Types::DateTimeType, required: false
        argument :end_time, LMSGraphQL::Types::DateTimeType, required: false
        def resolve(account_id:, start_time: nil, end_time: nil, get_all: false)
          result = context[:canvas_api].call("COURSE_AUDIT_LOG_QUERY_BY_ACCOUNT").proxy(
            "COURSE_AUDIT_LOG_QUERY_BY_ACCOUNT",
            {
              "account_id": account_id,
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