require_relative "../canvas_base_input_type"
require_relative "blueprint_migration"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasBlueprintTemplateInput < BaseInputObject
        description "Blueprint Courses. API Docs: https://canvas.instructure.com/doc/api/blueprint_courses.html"
        argument :id, ID, "The ID of the template..Example: 1", required: false
        argument :course_id, ID, "The ID of the Course the template belongs to..Example: 2", required: false
        argument :last_export_completed_at, LMSGraphQL::Types::DateTimeType, "Time when the last export was completed.Example: 2013-08-28T23:59:00-06:00", required: false
        argument :associated_course_count, Int, "Number of associated courses for the template.Example: 3", required: false
        argument :latest_migration, LMSGraphQL::Types::Canvas::CanvasBlueprintMigrationInput, "Details of the latest migration.", required: false

      end
    end
  end
end