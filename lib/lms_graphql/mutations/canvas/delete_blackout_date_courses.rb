require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/blackout_date"
module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteBlackoutDateCourse < BaseMutation
        argument :course_id, ID, required: true
        argument :id, ID, required: true
        
        
        field :blackout_date, LMSGraphQL::Types::Canvas::CanvasBlackoutDate, null: false
        
        def resolve(course_id:, id:)
          context[:canvas_api].call("DELETE_BLACKOUT_DATE_COURSES").proxy(
            "DELETE_BLACKOUT_DATE_COURSES",
            {
              "course_id": course_id,
              "id": id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end