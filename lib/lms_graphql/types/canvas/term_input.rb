require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasTermInput < BaseInputObject
        description "Courses. API Docs: https://canvas.instructure.com/doc/api/courses.html"
        argument :id, ID, "Example: 1", required: false
        argument :name, String, "Example: Default Term", required: false
        argument :start_at, LMSGraphQL::Types::DateTimeType, "Example: 2012-06-01T00:00:00-06:00", required: false
        argument :end_at, LMSGraphQL::Types::DateTimeType, "", required: false

      end
    end
  end
end