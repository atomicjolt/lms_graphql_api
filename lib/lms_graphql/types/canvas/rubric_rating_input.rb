require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasRubricRatingInput < BaseInputObject
          description "Rubrics. API Docs: https://canvas.instructure.com/doc/api/rubrics.html"
        argument :id, ID, "Example: name_2", required: false
        argument :criterion_id, ID, "Example: _10", required: false
        argument :description, String, "", required: false
        argument :long_description, String, "", required: false
        argument :points, Int, "Example: 5", required: false

      end
    end
  end
end