require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/content_migration"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetContentMigrationCourse < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasContentMigration, null: false
        argument :course_id, ID, required: true
        argument :id, ID, required: true
        def resolve(course_id:, id:, get_all: false)
          result = context[:canvas_api].call("GET_CONTENT_MIGRATION_COURSES").proxy(
            "GET_CONTENT_MIGRATION_COURSES",
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