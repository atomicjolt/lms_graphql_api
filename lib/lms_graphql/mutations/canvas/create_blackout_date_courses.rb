require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/blackout_date"
module LMSGraphQL
  module Mutations
    module Canvas
      class CreateBlackoutDateCourse < BaseMutation
        argument :course_id, ID, required: true
        argument :start_date, LMSGraphQL::Types::DateTimeType, required: false
        argument :end_date, LMSGraphQL::Types::DateTimeType, required: false
        argument :event_title, String, required: false
        
        
        field :blackout_date, LMSGraphQL::Types::Canvas::CanvasBlackoutDate, null: false
        
        def resolve(course_id:, start_date: nil, end_date: nil, event_title: nil)
          context[:canvas_api].call("CREATE_BLACKOUT_DATE_COURSES").proxy(
            "CREATE_BLACKOUT_DATE_COURSES",
            {
              "course_id": course_id
            },
            {
              "start_date": start_date,
              "end_date": end_date,
              "event_title": event_title
            },
          ).parsed_response
        end
      end
    end
  end
end