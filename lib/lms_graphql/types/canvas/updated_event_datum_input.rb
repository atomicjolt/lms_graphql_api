require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasUpdatedEventDatumInput < BaseInputObject
        description "Course Audit log. API Docs: https://canvas.instructure.com/doc/api/course_audit_log.html"
        argument :name, String, "Example: Course 1, Course 2", required: false
        argument :start_at, LMSGraphQL::Types::DateTimeType, "Example: 2012-01-19T15:00:00-06:00, 2012-07-19T15:00:00-06:00", required: false
        argument :conclude_at, LMSGraphQL::Types::DateTimeType, "Example: 2012-01-19T15:00:00-08:00, 2012-07-19T15:00:00-08:00", required: false
        argument :is_public, Boolean, "Example: true, false", required: false

      end
    end
  end
end