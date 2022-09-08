require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasUpdatedEventDatum < BaseType
          description "Course Audit log. API Docs: https://canvas.instructure.com/doc/api/course_audit_log.html"
        field :name, [String], "Example: Course 1, Course 2", null: true
        field :start_at, [GraphQL::Types::ISO8601DateTime], "Example: 2012-01-19T15:00:00-06:00, 2012-07-19T15:00:00-06:00", null: true
        field :conclude_at, [GraphQL::Types::ISO8601DateTime], "Example: 2012-01-19T15:00:00-08:00, 2012-07-19T15:00:00-08:00", null: true
        field :is_public, [Boolean], "Example: true, false", null: true

      end
    end
  end
end