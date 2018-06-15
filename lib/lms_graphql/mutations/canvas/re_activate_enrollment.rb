require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/enrollment"
module LMSGraphQL
  module Mutations
    module Canvas
      class ReActivateEnrollment < CanvasBaseMutation
        argument :course_id, ID, required: true
        argument :id, ID, required: true
        field :enrollment, LMSGraphQL::Types::Canvas::CanvasEnrollment, null: false
        def resolve(course_id:, id:)
          ctx[:canvas_api].proxy(
            "RE_ACTIVATE_ENROLLMENT",
            {
              "course_id": course_id,
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end