require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/day"
module LMSGraphQL
  module Resolvers
    module Canvas
      class DaysInGradebookHistoryForThisCourse < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasDay], null: false
        argument :get_all, Boolean, required: false
        argument :course_id, ID, required: true
        def resolve(course_id:, get_all: false)
          result = context[:canvas_api].call("DAYS_IN_GRADEBOOK_HISTORY_FOR_THIS_COURSE").proxy(
            "DAYS_IN_GRADEBOOK_HISTORY_FOR_THIS_COURSE",
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