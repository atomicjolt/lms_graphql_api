require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasAssignmentExtension < BaseType
        description "Assignment Extensions. API Docs: https://canvas.instructure.com/doc/api/assignment_extensions.html"
      	field :assignment_id, ID, "The ID of the Assignment the extension belongs to..Example: 2", null: true
      	field :user_id, ID, "The ID of the Student that needs the assignment extension..Example: 3", null: true
      	field :extra_attempts, Int, "Number of times the student is allowed to re-submit the assignment.Example: 2", null: true

      end
    end
  end
end