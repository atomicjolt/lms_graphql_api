require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasAssessmentInput < BaseInputObject
        description "LiveAssessments. API Docs: https://canvas.instructure.com/doc/api/live_assessments.html"
      argument :id, ID, "A unique identifier for this live assessment.Example: 42", required: false
      argument :key, String, "A client specified unique identifier for the assessment.Example: 2014-05-27,outcome_52", required: false
      argument :title, String, "A human readable title for the assessment.Example: May 27th Reading Assessment", required: false

      end
    end
  end
end