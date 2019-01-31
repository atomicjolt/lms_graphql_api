require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class CourseActivityStreamSummary < CanvasBaseResolver
        type Boolean, null: false
        argument :course_id, ID, required: true
        def resolve(course_id:, get_all: false)
          result = context[:canvas_api].call("COURSE_ACTIVITY_STREAM_SUMMARY").proxy(
            "COURSE_ACTIVITY_STREAM_SUMMARY",
            {
              "course_id": course_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end