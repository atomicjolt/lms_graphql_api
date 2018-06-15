require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/epub_export"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ShowEpubExport < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasEpubExport, null: false
        argument :course_id, ID, required: true
        argument :id, ID, required: true
        def resolve(course_id:, id:)
          context[:canvas_api].proxy(
            "SHOW_EPUB_EXPORT",
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