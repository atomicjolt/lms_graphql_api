require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasOutcomePathPart < BaseType
          description "Outcome Results. API Docs: https://canvas.instructure.com/doc/api/outcome_results.html"
        field :name, String, "The title of the outcome or outcome group.Example: Spelling out numbers", null: true

      end
    end
  end
end