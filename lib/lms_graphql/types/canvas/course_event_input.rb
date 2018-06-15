require_relative "../canvas_base_input_type"
require_relative "course_event_link"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasCourseEventInput < BaseInputObject
        description "Course Audit log. API Docs: https://canvas.instructure.com/doc/api/course_audit_log.html"
        argument :id, ID, "ID of the event..Example: e2b76430-27a5-0131-3ca1-48e0eb13f29b", required: false
        argument :created_at, LMSGraphQL::Types::DateTimeType, "timestamp of the event.Example: 2012-07-19T15:00:00-06:00", required: false
        argument :event_type, String, "Course event type The event type defines the type and schema of the event_data object..Example: updated", required: false
        argument :event_data, String, "Course event data depending on the event type.  This will return an object containing the relevant event data.  An updated event type will return an UpdatedEventData object..Example: {}", required: false
        argument :event_source, String, "Course event source depending on the event type.  This will return a string containing the source of the event..Example: manual|sis|api", required: false
        argument :links, LMSGraphQL::Types::Canvas::CanvasCourseEventLink, "Jsonapi.org links.Example: 12345, 12345, e2b76430-27a5-0131-3ca1-48e0eb13f29b", required: false

      end
    end
  end
end