require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasOutcomeImportDatumInput < BaseInputObject
        description "Outcome Imports. API Docs: https://canvas.instructure.com/doc/api/outcome_imports.html"
      	argument :import_type, String, "The type of outcome import.Example: instructure_csv", required: false

      end
    end
  end
end