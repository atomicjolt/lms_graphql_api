require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/file"
module LMSGraphQL
  module Resolvers
    module Canvas
      class TranslateFileReference < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasFile, null: false
        argument :course_id, ID, required: true
        argument :migration_id, ID, required: true
        def resolve(course_id:, migration_id:, get_all: false)
          result = context[:canvas_api].call("TRANSLATE_FILE_REFERENCE").proxy(
            "TRANSLATE_FILE_REFERENCE",
            {
              "course_id": course_id,
              "migration_id": migration_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end