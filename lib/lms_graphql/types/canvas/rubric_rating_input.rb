require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasRubricRatingInput < BaseInputObject
        description "Assignments. API Docs: https://canvas.instructure.com/doc/api/assignments.html"
        argument :points, Int, "Example: 10", required: false
        argument :id, ID, "Example: rat1", required: false
        argument :description, String, "Example: Full marks", required: false
        argument :long_description, String, "Example: Student completed the assignment flawlessly.", required: false

      end
    end
  end
end