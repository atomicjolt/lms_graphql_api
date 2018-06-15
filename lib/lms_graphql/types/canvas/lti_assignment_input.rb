require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasLtiAssignmentInput < BaseInputObject
        description "Plagiarism Detection Platform Assignments. API Docs: https://canvas.instructure.com/doc/api/plagiarism_detection_platform_assignments.html"
        argument :id, ID, "Example: 4", required: false
        argument :name, String, "Example: Midterm Review", required: false
        argument :description, String, "Example: <p>Do the following:</p>.", required: false
        argument :points_possible, Int, "Example: 10", required: false
        argument :due_at, LMSGraphQL::Types::DateTimeType, "The due date for the assignment. If a user id is supplied and an assignment override is in place this field will reflect the due date as it applies to the user..Example: 2012-07-01T23:59:00-06:00", required: false
        argument :lti_id, ID, "Example: 86157096483e6b3a50bfedc6bac902c0b20a824f", required: false

      end
    end
  end
end