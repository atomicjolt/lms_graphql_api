require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasOutcomeImportDatum < BaseType
        description "Outcome Imports. API Docs: https://canvas.instructure.com/doc/api/outcome_imports.html"
        field :import_type, String, "The type of outcome import.Example: instructure_csv", null: true

      end
    end
  end
end