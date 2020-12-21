require_relative "../canvas_base_type"
require_relative "blueprint_migration"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasBlueprintTemplate < BaseType
        description "Blueprint Courses. API Docs: https://canvas.instructure.com/doc/api/blueprint_courses.html"
      	field :id, ID, "The ID of the template..Example: 1", null: true
      	field :course_id, ID, "The ID of the Course the template belongs to..Example: 2", null: true
      	field :last_export_completed_at, LMSGraphQL::Types::DateTimeType, "Time when the last export was completed.Example: 2013-08-28T23:59:00-06:00", null: true
      	field :associated_course_count, Int, "Number of associated courses for the template.Example: 3", null: true
      	field :latest_migration, LMSGraphQL::Types::Canvas::CanvasBlueprintMigration, "Details of the latest migration.", null: true

      end
    end
  end
end