require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/epub_export"
module LMSGraphQL
  module Mutations
    module Canvas
      class CreateEpubExport < CanvasBaseMutation
        argument :course_id, ID, required: true
        field :epub_export, LMSGraphQL::Types::Canvas::CanvasEpubExport, null: false
        def resolve(course_id:)
          context[:canvas_api].call("CREATE_EPUB_EXPORT").proxy(
            "CREATE_EPUB_EXPORT",
            {
              "course_id": course_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end