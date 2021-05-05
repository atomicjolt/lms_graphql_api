require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasCourseEventLinkInput < BaseInputObject
          description "Course Audit log. API Docs: https://canvas.instructure.com/doc/api/course_audit_log.html"
      argument :course, Int, "ID of the course for the event..Example: 12345", required: false
      argument :user, Int, "ID of the user for the event (who made the change)..Example: 12345", required: false
      argument :page_view, String, "ID of the page view during the event if it exists..Example: e2b76430-27a5-0131-3ca1-48e0eb13f29b", required: false
      argument :copied_from, Int, "ID of the course that this course was copied from. This is only included if the event_type is copied_from..Example: 12345", required: false
      argument :copied_to, Int, "ID of the course that this course was copied to. This is only included if the event_type is copied_to..Example: 12345", required: false
      argument :sis_batch, Int, "ID of the SIS batch that triggered the event..Example: 12345", required: false

      end
    end
  end
end