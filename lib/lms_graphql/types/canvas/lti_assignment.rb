require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasLtiAssignment < BaseType
          description "Plagiarism Detection Platform Assignments. API Docs: https://canvas.instructure.com/doc/api/plagiarism_detection_platform_assignments.html"
        field :id, ID, "Example: 4", null: true
        field :name, String, "Example: Midterm Review", null: true
        field :description, String, "Example: <p>Do the following:</p>.", null: true
        field :points_possible, Int, "Example: 10", null: true
        field :due_at, GraphQL::Types::ISO8601DateTime, "The due date for the assignment. If a user id is supplied and an assignment override is in place this field will reflect the due date as it applies to the user..Example: 2012-07-01T23:59:00-06:00", null: true
        field :lti_id, ID, "Example: 86157096483e6b3a50bfedc6bac902c0b20a824f", null: true
        field :course_id, ID, "Example: 10000000000060", null: true
        field :lti_course_id, ID, "Example: 66157096483e6b3a50bfedc6bac902c0b20a8241", null: true

      end
    end
  end
end