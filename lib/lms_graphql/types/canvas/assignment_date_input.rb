require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasAssignmentDateInput < BaseInputObject
          description "Assignments. API Docs: https://canvas.instructure.com/doc/api/assignments.html"
        argument :id, ID, "(Optional, missing if 'base' is present) id of the assignment override this date represents.Example: 1", required: false
        argument :base, Boolean, "(Optional, present if 'id' is missing) whether this date represents the assignment's or quiz's default due date.Example: true", required: false
        argument :title, String, "Example: Summer Session", required: false
        argument :due_at, GraphQL::Types::ISO8601DateTime, "The due date for the assignment. Must be between the unlock date and the lock date if there are lock dates.Example: 2013-08-28T23:59:00-06:00", required: false
        argument :unlock_at, GraphQL::Types::ISO8601DateTime, "The unlock date for the assignment. Must be before the due date if there is a due date..Example: 2013-08-01T00:00:00-06:00", required: false
        argument :lock_at, GraphQL::Types::ISO8601DateTime, "The lock date for the assignment. Must be after the due date if there is a due date..Example: 2013-08-31T23:59:00-06:00", required: false

      end
    end
  end
end