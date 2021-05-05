require_relative "../canvas_base_input_type"
require_relative "outcome_path_part"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasOutcomePathInput < BaseInputObject
          description "Outcome Results. API Docs: https://canvas.instructure.com/doc/api/outcome_results.html"
      argument :id, ID, "A unique identifier for this outcome.Example: 42", required: false
      argument :parts, LMSGraphQL::Types::Canvas::CanvasOutcomePathPartInput, "an array of OutcomePathPart objects.", required: false

      end
    end
  end
end