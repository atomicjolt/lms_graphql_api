require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/enrollment"
module LMSGraphQL
  module Mutations
    module Canvas
      class ReActivateEnrollment < BaseMutation
        argument :course_id, ID, required: true
        argument :id, ID, required: true
        
        
        field :enrollment, LMSGraphQL::Types::Canvas::CanvasEnrollment, null: false
        
        def resolve(course_id:, id:)
          context[:canvas_api].call("RE_ACTIVATE_ENROLLMENT").proxy(
            "RE_ACTIVATE_ENROLLMENT",
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