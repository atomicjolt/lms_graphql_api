require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasAssignmentOverrideInput < BaseInputObject
        description "Assignments. API Docs: https://canvas.instructure.com/doc/api/assignments.html"
      argument :id, ID, "the ID of the assignment override.Example: 4", required: false
      argument :assignment_id, ID, "the ID of the assignment the override applies to.Example: 123", required: false
      argument :student_ids, [ID], "the IDs of the override's target students (present if the override targets an ad-hoc set of students).Example: 1, 2, 3", required: false
      argument :group_id, ID, "the ID of the override's target group (present if the override targets a group and the assignment is a group assignment).Example: 2", required: false
      argument :course_section_id, ID, "the ID of the overrides's target section (present if the override targets a section).Example: 1", required: false
      argument :title, String, "the title of the override.Example: an assignment override", required: false
      argument :due_at, LMSGraphQL::Types::DateTimeType, "the overridden due at (present if due_at is overridden).Example: 2012-07-01T23:59:00-06:00", required: false
      argument :all_day, Boolean, "the overridden all day flag (present if due_at is overridden).Example: true", required: false
      argument :all_day_date, LMSGraphQL::Types::DateTimeType, "the overridden all day date (present if due_at is overridden).Example: 2012-07-01", required: false
      argument :unlock_at, LMSGraphQL::Types::DateTimeType, "the overridden unlock at (present if unlock_at is overridden).Example: 2012-07-01T23:59:00-06:00", required: false
      argument :lock_at, LMSGraphQL::Types::DateTimeType, "the overridden lock at, if any (present if lock_at is overridden).Example: 2012-07-01T23:59:00-06:00", required: false

      end
    end
  end
end