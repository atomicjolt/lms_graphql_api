require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasQuizAssignmentOverrideInput < BaseInputObject
          description "Quiz Assignment Overrides. API Docs: https://canvas.instructure.com/doc/api/quiz_assignment_overrides.html"
      argument :id, ID, "ID of the assignment override, unless this is the base construct, in which case the 'id' field is omitted..Example: 1", required: false
      argument :due_at, LMSGraphQL::Types::DateTimeType, "The date after which any quiz submission is considered late..Example: 2014-02-21T06:59:59Z", required: false
      argument :unlock_at, LMSGraphQL::Types::DateTimeType, "Date when the quiz becomes available for taking..", required: false
      argument :lock_at, LMSGraphQL::Types::DateTimeType, "When the quiz will stop being available for taking. A value of null means it can always be taken..Example: 2014-02-21T06:59:59Z", required: false
      argument :title, String, "Title of the section this assignment override is for, if any..Example: Project X", required: false
      argument :base, Boolean, "If this property is present, it means that dates in this structure are not based on an assignment override, but are instead for all students..Example: true", required: false

      end
    end
  end
end