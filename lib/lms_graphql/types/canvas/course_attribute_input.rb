require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasCourseAttributeInput < BaseInputObject
        description "SIS Integration. API Docs: https://canvas.instructure.com/doc/api/sis_integration.html"
      argument :id, ID, "The unique Canvas identifier for the origin course.Example: 7", required: false
      argument :name, String, "The name of the origin course..Example: Section A", required: false
      argument :sis_id, ID, "The sis id of the origin_course..Example: c34643", required: false
      argument :integration_id, ID, "The integration ID of the origin_course..Example: I-2", required: false

      end
    end
  end
end