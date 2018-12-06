require_relative "../canvas_base_input_type"
require_relative "student_attribute"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasUserAssignmentOverrideAttributeInput < BaseInputObject
        description "SIS Integration. API Docs: https://canvas.instructure.com/doc/api/sis_integration.html"
        argument :id, ID, "The unique Canvas identifier for the assignment override.Example: 218", required: false
        argument :title, String, "The title of the assignment override..Example: Override title", required: false
        argument :due_at, LMSGraphQL::Types::DateTimeType, "The time at which this assignment is due.Example: 2013-01-01T00:00:00-06:00", required: false
        argument :unlock_at, LMSGraphQL::Types::DateTimeType, "(Optional) Time at which this was/will be unlocked..Example: 2013-01-01T00:00:00-06:00", required: false
        argument :lock_at, LMSGraphQL::Types::DateTimeType, "(Optional) Time at which this was/will be locked..Example: 2013-02-01T00:00:00-06:00", required: false
        argument :students, [LMSGraphQL::Types::Canvas::CanvasStudentAttributeInput], "Includes attributes of a student for convenience. For more details see Users API..", required: false

      end
    end
  end
end