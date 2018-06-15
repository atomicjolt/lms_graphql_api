require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/content_migration"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListContentMigrationsCourse < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasContentMigration], null: false
        argument :course_id, ID, required: true
        def resolve(course_id:)
          context[:canvas_api].proxy(
            "LIST_CONTENT_MIGRATIONS_COURSES",
            {
              "course_id": course_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end