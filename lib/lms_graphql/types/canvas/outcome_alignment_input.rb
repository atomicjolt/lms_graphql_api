require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasOutcomeAlignmentInput < BaseInputObject
        description "Outcome Results. API Docs: https://canvas.instructure.com/doc/api/outcome_results.html"
        argument :id, ID, "A unique identifier for this alignment.Example: quiz_3", required: false
        argument :name, String, "The name of this alignment.Example: Big mid-term test", required: false
        argument :html_url, String, "(Optional) A URL for details about this alignment.", required: false

      end
    end
  end
end