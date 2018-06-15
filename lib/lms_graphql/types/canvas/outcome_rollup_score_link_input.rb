require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasOutcomeRollupScoreLinkInput < BaseInputObject
        description "Outcome Results. API Docs: https://canvas.instructure.com/doc/api/outcome_results.html"
        argument :outcome, Int, "The id of the related outcome.Example: 42", required: false

      end
    end
  end
end