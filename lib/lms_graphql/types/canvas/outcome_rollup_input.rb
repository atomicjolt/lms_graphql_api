require_relative "../canvas_base_input_type"
require_relative "outcome_rollup_score"
require_relative "outcome_rollup_link"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasOutcomeRollupInput < BaseInputObject
        description "Outcome Results. API Docs: https://canvas.instructure.com/doc/api/outcome_results.html"
      	argument :scores, LMSGraphQL::Types::Canvas::CanvasOutcomeRollupScoreInput, "an array of OutcomeRollupScore objects.", required: false
      	argument :name, String, "The name of the resource for this rollup. For example, the user name..Example: John Doe", required: false
      	argument :links, LMSGraphQL::Types::Canvas::CanvasOutcomeRollupLinkInput, "Example: 42, 42, 57", required: false

      end
    end
  end
end