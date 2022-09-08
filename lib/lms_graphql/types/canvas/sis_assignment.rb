require_relative "../canvas_base_type"
require_relative "assignment_group_attribute"
require_relative "section_attribute"
require_relative "user_assignment_override_attribute"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasSisAssignment < BaseType
          class SisAssignmentSubmissionTypeEnum < ::GraphQL::Schema::Enum
          value "discussion_topic"
          value "online_quiz"
          value "on_paper"
          value "not_graded"
          value "none"
          value "external_tool"
          value "online_text_entry"
          value "online_url"
          value "online_upload"
          value "media_recording"
          value "student_annotation"
        end
        description "SIS Integration. API Docs: https://canvas.instructure.com/doc/api/sis_integration.html"
        field :id, ID, "The unique identifier for the assignment..Example: 4", null: true
        field :course_id, ID, "The unique identifier for the course..Example: 6", null: true
        field :name, String, "the name of the assignment.Example: some assignment", null: true
        field :created_at, GraphQL::Types::ISO8601DateTime, "The time at which this assignment was originally created.Example: 2012-07-01T23:59:00-06:00", null: true
        field :due_at, GraphQL::Types::ISO8601DateTime, "the due date for the assignment. returns null if not present. NOTE: If this assignment has assignment overrides, this field will be the due date as it applies to the user requesting information from the API..Example: 2012-07-01T23:59:00-06:00", null: true
        field :unlock_at, GraphQL::Types::ISO8601DateTime, "(Optional) Time at which this was/will be unlocked..Example: 2013-01-01T00:00:00-06:00", null: true
        field :lock_at, GraphQL::Types::ISO8601DateTime, "(Optional) Time at which this was/will be locked..Example: 2013-02-01T00:00:00-06:00", null: true
        field :points_possible, Int, "The maximum points possible for the assignment.Example: 12", null: true
        field :submission_types, SisAssignmentSubmissionTypeEnum, "the types of submissions allowed for this assignment list containing one or more of the following: 'discussion_topic', 'online_quiz', 'on_paper', 'none', 'external_tool', 'online_text_entry', 'online_url', 'online_upload', 'media_recording', 'student_annotation'.Example: online_text_entry", null: true
        field :integration_id, ID, "Third Party integration id for assignment.Example: 12341234", null: true
        field :integration_data, String, "(optional, Third Party integration data for assignment).Example: other_data", null: true
        field :include_in_final_grade, Boolean, "If false, the assignment will be omitted from the student's final grade.Example: true", null: true
        field :assignment_group, [LMSGraphQL::Types::Canvas::CanvasAssignmentGroupAttribute], "Includes attributes of a assignment_group for convenience. For more details see Assignments API..", null: true
        field :sections, [LMSGraphQL::Types::Canvas::CanvasSectionAttribute], "Includes attributes of a section for convenience. For more details see Sections API..", null: true
        field :user_overrides, [LMSGraphQL::Types::Canvas::CanvasUserAssignmentOverrideAttribute], "Includes attributes of a user assignment overrides. For more details see Assignments API..", null: true

      end
    end
  end
end