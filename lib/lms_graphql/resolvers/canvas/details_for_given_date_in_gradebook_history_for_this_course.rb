require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/grader"
module LMSGraphQL
  module Resolvers
    module Canvas
      class DetailsForGivenDateInGradebookHistoryForThisCourse < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasGrader], null: false
        argument :get_all, Boolean, required: false
        argument :course_id, ID, required: true
        argument :date, String, required: true
        def resolve(course_id:, date:, get_all: false)
          result = context[:canvas_api].call("DETAILS_FOR_GIVEN_DATE_IN_GRADEBOOK_HISTORY_FOR_THIS_COURSE").proxy(
            "DETAILS_FOR_GIVEN_DATE_IN_GRADEBOOK_HISTORY_FOR_THIS_COURSE",
            {
              "course_id": course_id,
              "date": date            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end