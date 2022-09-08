require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasCalendarLinkInput < BaseInputObject
          description "Courses. API Docs: https://canvas.instructure.com/doc/api/courses.html"
        argument :ics, String, "The URL of the calendar in ICS format.Example: https://canvas.instructure.com/feeds/calendars/course_abcdef.ics", required: false

      end
    end
  end
end