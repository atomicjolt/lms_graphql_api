require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/blackout_date"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSingleBlackoutDateCourse < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasBlackoutDate, null: false
        argument :course_id, ID, required: true
        argument :id, ID, required: true
        def resolve(course_id:, id:, get_all: false)
          result = context[:canvas_api].call("GET_SINGLE_BLACKOUT_DATE_COURSES").proxy(
            "GET_SINGLE_BLACKOUT_DATE_COURSES",
            {
              "course_id": course_id,
              "id": id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end