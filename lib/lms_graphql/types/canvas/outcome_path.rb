require_relative "../canvas_base_type"
require_relative "outcome_path_part"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasOutcomePath < BaseType
        description "Outcome Results. API Docs: https://canvas.instructure.com/doc/api/outcome_results.html"
      	field :id, ID, "A unique identifier for this outcome.Example: 42", null: true
      	field :parts, LMSGraphQL::Types::Canvas::CanvasOutcomePathPart, "an array of OutcomePathPart objects.", null: true

      end
    end
  end
end