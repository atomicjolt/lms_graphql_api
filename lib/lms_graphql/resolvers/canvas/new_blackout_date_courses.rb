require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/blackout_date"
module LMSGraphQL
  module Resolvers
    module Canvas
      class NewBlackoutDateCourse < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasBlackoutDate, null: false
        argument :course_id, ID, required: true
        def resolve(course_id:, get_all: false)
          result = context[:canvas_api].call("NEW_BLACKOUT_DATE_COURSES").proxy(
            "NEW_BLACKOUT_DATE_COURSES",
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