require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasResultLinkInput < BaseInputObject
        description "LiveAssessments. API Docs: https://canvas.instructure.com/doc/api/live_assessments.html"
      argument :user, String, "A unique identifier for the user to whom this result applies.Example: 42", required: false
      argument :assessor, String, "A unique identifier for the user who created this result.Example: 23", required: false
      argument :assessment, String, "A unique identifier for the assessment that this result is for.Example: 5", required: false

      end
    end
  end
end