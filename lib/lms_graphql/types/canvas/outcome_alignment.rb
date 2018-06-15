require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasOutcomeAlignment < BaseType
        description "Outcome Results. API Docs: https://canvas.instructure.com/doc/api/outcome_results.html"
        field :id, ID, "A unique identifier for this alignment.Example: quiz_3", null: true
        field :name, String, "The name of this alignment.Example: Big mid-term test", null: true
        field :html_url, String, "(Optional) A URL for details about this alignment.", null: true

      end
    end
  end
end