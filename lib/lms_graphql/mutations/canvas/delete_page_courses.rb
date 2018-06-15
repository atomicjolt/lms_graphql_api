require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/page"
module LMSGraphQL
  module Mutations
    module Canvas
      class DeletePageCourse < CanvasBaseMutation
        argument :course_id, ID, required: true
        argument :url, String, required: true
        field :page, LMSGraphQL::Types::Canvas::CanvasPage, null: false
        def resolve(course_id:, url:)
          context[:canvas_api].call("DELETE_PAGE_COURSES").proxy(
            "DELETE_PAGE_COURSES",
            {
              "course_id": course_id,
              "url": url            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end