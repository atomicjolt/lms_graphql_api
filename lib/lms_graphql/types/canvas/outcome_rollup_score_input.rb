require_relative "../canvas_base_input_type"
require_relative "outcome_rollup_score_link"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasOutcomeRollupScoreInput < BaseInputObject
        description "Outcome Results. API Docs: https://canvas.instructure.com/doc/api/outcome_results.html"
        argument :score, Int, "The rollup score for the outcome, based on the student alignment scores related to the outcome. This could be null if the student has no related scores..Example: 3", required: false
        argument :count, Int, "The number of alignment scores included in this rollup..Example: 6", required: false
        argument :links, LMSGraphQL::Types::Canvas::CanvasOutcomeRollupScoreLinkInput, "Example: 42", required: false

      end
    end
  end
end