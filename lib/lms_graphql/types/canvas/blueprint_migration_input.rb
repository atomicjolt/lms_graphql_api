require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasBlueprintMigrationInput < BaseInputObject
        description "Blueprint Courses. API Docs: https://canvas.instructure.com/doc/api/blueprint_courses.html"
      	argument :id, ID, "The ID of the migration..Example: 1", required: false
      	argument :template_id, ID, "The ID of the template the migration belongs to. Only present when querying a blueprint course..Example: 2", required: false
      	argument :subscription_id, ID, "The ID of the associated course's blueprint subscription. Only present when querying a course associated with a blueprint..Example: 101", required: false
      	argument :user_id, ID, "The ID of the user who queued the migration..Example: 3", required: false
      	argument :workflow_state, String, "Current state of the content migration: queued, exporting, imports_queued, completed, exports_failed, imports_failed.Example: running", required: false
      	argument :created_at, LMSGraphQL::Types::DateTimeType, "Time when the migration was queued.Example: 2013-08-28T23:59:00-06:00", required: false
      	argument :exports_started_at, LMSGraphQL::Types::DateTimeType, "Time when the exports begun.Example: 2013-08-28T23:59:00-06:00", required: false
      	argument :imports_queued_at, LMSGraphQL::Types::DateTimeType, "Time when the exports were completed and imports were queued.Example: 2013-08-28T23:59:00-06:00", required: false
      	argument :imports_completed_at, LMSGraphQL::Types::DateTimeType, "Time when the imports were completed.Example: 2013-08-28T23:59:00-06:00", required: false
      	argument :comment, String, "User-specified comment describing changes made in this operation.Example: Fixed spelling in question 3 of midterm exam", required: false

      end
    end
  end
end