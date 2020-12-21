require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasOutcomePathPartInput < BaseInputObject
        description "Outcome Results. API Docs: https://canvas.instructure.com/doc/api/outcome_results.html"
      	argument :name, String, "The title of the outcome or outcome group.Example: Spelling out numbers", required: false

      end
    end
  end
end