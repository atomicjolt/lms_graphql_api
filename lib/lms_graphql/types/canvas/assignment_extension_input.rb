require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasAssignmentExtensionInput < BaseInputObject
          description "Assignment Extensions. API Docs: https://canvas.instructure.com/doc/api/assignment_extensions.html"
        argument :assignment_id, ID, "The ID of the Assignment the extension belongs to..Example: 2", required: false
        argument :user_id, ID, "The ID of the Student that needs the assignment extension..Example: 3", required: false
        argument :extra_attempts, Int, "Number of times the student is allowed to re-submit the assignment.Example: 2", required: false

      end
    end
  end
end