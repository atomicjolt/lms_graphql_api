require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class CoursesPreviewProcessedHtml < CanvasBaseMutation
        argument :course_id, ID, required: true
        argument :html, String, required: false
        field :return_value, Boolean, null: false
        def resolve(course_id:, html: nil)
          context[:canvas_api].call("COURSES_PREVIEW_PROCESSED_HTML").proxy(
            "COURSES_PREVIEW_PROCESSED_HTML",
            {
              "course_id": course_id,
              "html": html            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end