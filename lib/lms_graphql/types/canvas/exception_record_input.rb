require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasExceptionRecordInput < BaseInputObject
        description "Blueprint Courses. API Docs: https://canvas.instructure.com/doc/api/blueprint_courses.html"
      	argument :course_id, ID, "The ID of the associated course.Example: 101", required: false
      	argument :conflicting_changes, String, "A list of change classes in the associated course's copy of the item that prevented a blueprint change from being applied. One or more of ['content', 'points', 'due_dates', 'availability_dates']..Example: points", required: false

      end
    end
  end
end