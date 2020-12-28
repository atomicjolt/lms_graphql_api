require_relative "../canvas_base_type"
require_relative "student_attribute"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasUserAssignmentOverrideAttribute < BaseType
        description "SIS Integration. API Docs: https://canvas.instructure.com/doc/api/sis_integration.html"
        field :id, ID, "The unique Canvas identifier for the assignment override.Example: 218", null: true
        field :title, String, "The title of the assignment override..Example: Override title", null: true
        field :due_at, LMSGraphQL::Types::DateTimeType, "The time at which this assignment is due.Example: 2013-01-01T00:00:00-06:00", null: true
        field :unlock_at, LMSGraphQL::Types::DateTimeType, "(Optional) Time at which this was/will be unlocked..Example: 2013-01-01T00:00:00-06:00", null: true
        field :lock_at, LMSGraphQL::Types::DateTimeType, "(Optional) Time at which this was/will be locked..Example: 2013-02-01T00:00:00-06:00", null: true
        field :students, [LMSGraphQL::Types::Canvas::CanvasStudentAttribute], "Includes attributes of a student for convenience. For more details see Users API..", null: true

      end
    end
  end
end