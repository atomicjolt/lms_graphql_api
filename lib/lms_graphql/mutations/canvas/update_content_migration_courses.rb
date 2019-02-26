require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/content_migration"
module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateContentMigrationCourse < BaseMutation
        argument :course_id, ID, required: true
        argument :id, ID, required: true
        field :content_migration, LMSGraphQL::Types::Canvas::CanvasContentMigration, null: false
        def resolve(course_id:, id:)
          context[:canvas_api].call("UPDATE_CONTENT_MIGRATION_COURSES").proxy(
            "UPDATE_CONTENT_MIGRATION_COURSES",
            {
              "course_id": course_id,
              "id": id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end