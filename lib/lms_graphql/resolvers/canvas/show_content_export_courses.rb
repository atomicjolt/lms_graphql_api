require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/content_export"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ShowContentExportCourse < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasContentExport, null: false
        argument :course_id, ID, required: true
        argument :id, ID, required: true
        def resolve(course_id:, id:, get_all: false)
          result = context[:canvas_api].call("SHOW_CONTENT_EXPORT_COURSES").proxy(
            "SHOW_CONTENT_EXPORT_COURSES",
            {
              "course_id": course_id,
              "id": id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end