require_relative "../canvas_base_input_type"
require_relative "assignment"
require_relative "assignment_override"

module LMSGraphQL
  module Types
    module Canvas
        class AssignmentEventWorkflowStateEnum < ::GraphQL::Schema::Enum
          value "published"
          value "deleted"
        end
      class CanvasAssignmentEventInput < BaseInputObject
        description "Calendar Events. API Docs: https://canvas.instructure.com/doc/api/calendar_events.html"
      argument :id, ID, "A synthetic ID for the assignment.Example: assignment_987", required: false
      argument :title, String, "The title of the assignment.Example: Essay", required: false
      argument :start_at, LMSGraphQL::Types::DateTimeType, "The due_at timestamp of the assignment.Example: 2012-07-19T23:59:00-06:00", required: false
      argument :end_at, LMSGraphQL::Types::DateTimeType, "The due_at timestamp of the assignment.Example: 2012-07-19T23:59:00-06:00", required: false
      argument :description, String, "The HTML description of the assignment.Example: <b>Write an essay. Whatever you want.</b>", required: false
      argument :context_code, String, "the context code of the (course) calendar this assignment belongs to.Example: course_123", required: false
      argument :workflow_state, AssignmentEventWorkflowStateEnum, "Current state of the assignment ('published' or 'deleted').Example: published", required: false
      argument :url, String, "URL for this assignment (note that updating/deleting should be done via the Assignments API).Example: https://example.com/api/v1/calendar_events/assignment_987", required: false
      argument :html_url, String, "URL for a user to view this assignment.Example: http://example.com/courses/123/assignments/987", required: false
      argument :all_day_date, LMSGraphQL::Types::DateTimeType, "The due date of this assignment.Example: 2012-07-19", required: false
      argument :all_day, Boolean, "Boolean indicating whether this is an all-day event (e.g. assignment due at midnight).Example: true", required: false
      argument :created_at, LMSGraphQL::Types::DateTimeType, "When the assignment was created.Example: 2012-07-12T10:55:20-06:00", required: false
      argument :updated_at, LMSGraphQL::Types::DateTimeType, "When the assignment was last updated.Example: 2012-07-12T10:55:20-06:00", required: false
      argument :assignment, LMSGraphQL::Types::Canvas::CanvasAssignmentInput, "The full assignment JSON data (See the Assignments API).", required: false
      argument :assignment_overrides, LMSGraphQL::Types::Canvas::CanvasAssignmentOverrideInput, "The list of AssignmentOverrides that apply to this event (See the Assignments API). This information is useful for determining which students or sections this assignment-due event applies to..", required: false

      end
    end
  end
end