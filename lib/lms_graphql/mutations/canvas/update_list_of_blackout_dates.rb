require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/blackout_date"
module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateListOfBlackoutDate < BaseMutation
        argument :course_id, ID, required: true
        argument :blackout_dates, String, required: false
        
        
        field :blackout_date, [LMSGraphQL::Types::Canvas::CanvasBlackoutDate], null: false
        
        def resolve(course_id:, blackout_dates: nil)
          context[:canvas_api].call("UPDATE_LIST_OF_BLACKOUT_DATES").proxy(
            "UPDATE_LIST_OF_BLACKOUT_DATES",
            {
              "course_id": course_id
            },
            {
              "blackout_dates:": blackout_dates
            },
          ).parsed_response
        end
      end
    end
  end
end