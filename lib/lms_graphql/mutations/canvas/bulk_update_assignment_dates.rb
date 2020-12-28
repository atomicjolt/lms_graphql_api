require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/progress"
module LMSGraphQL
  module Mutations
    module Canvas
      class BulkUpdateAssignmentDate < BaseMutation
        argument :course_id, ID, required: true
        
        
        field :progress, LMSGraphQL::Types::Canvas::CanvasProgress, null: false
        
        def resolve(course_id:)
          context[:canvas_api].call("BULK_UPDATE_ASSIGNMENT_DATES").proxy(
            "BULK_UPDATE_ASSIGNMENT_DATES",
            {
              "course_id": course_id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end