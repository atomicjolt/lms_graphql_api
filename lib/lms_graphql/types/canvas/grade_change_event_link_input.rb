require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasGradeChangeEventLinkInput < BaseInputObject
          description "Grade Change Log. API Docs: https://canvas.instructure.com/doc/api/grade_change_log.html"
      argument :assignment, Int, "ID of the assignment associated with the event.Example: 2319", required: false
      argument :course, Int, "ID of the course associated with the event. will match the context_id in the associated assignment if the context type for the assignment is a course.Example: 2319", required: false
      argument :student, Int, "ID of the student associated with the event. will match the user_id in the associated submission..Example: 2319", required: false
      argument :grader, Int, "ID of the grader associated with the event. will match the grader_id in the associated submission..Example: 2319", required: false
      argument :page_view, String, "ID of the page view during the event if it exists..Example: e2b76430-27a5-0131-3ca1-48e0eb13f29b", required: false

      end
    end
  end
end