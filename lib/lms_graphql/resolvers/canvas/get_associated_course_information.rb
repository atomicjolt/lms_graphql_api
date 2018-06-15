require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/course"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetAssociatedCourseInformation < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::Course], null: false
        argument :course_id, ID, required: true
        argument :template_id, ID, required: true
        def resolve(course_id:, template_id:)
          context[:canvas_api].proxy(
            "GET_ASSOCIATED_COURSE_INFORMATION",
            {
              "course_id": course_id,
              "template_id": template_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end