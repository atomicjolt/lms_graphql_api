require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasSectionAssignmentOverrideAttributeInput < BaseInputObject
          description "SIS Integration. API Docs: https://canvas.instructure.com/doc/api/sis_integration.html"
        argument :override_title, String, "The title for the assignment override.Example: some section override", required: false
        argument :due_at, GraphQL::Types::ISO8601DateTime, "the due date for the assignment. returns null if not present. NOTE: If this assignment has assignment overrides, this field will be the due date as it applies to the user requesting information from the API..Example: 2012-07-01T23:59:00-06:00", required: false
        argument :unlock_at, GraphQL::Types::ISO8601DateTime, "(Optional) Time at which this was/will be unlocked..Example: 2013-01-01T00:00:00-06:00", required: false
        argument :lock_at, GraphQL::Types::ISO8601DateTime, "(Optional) Time at which this was/will be locked..Example: 2013-02-01T00:00:00-06:00", required: false

      end
    end
  end
end