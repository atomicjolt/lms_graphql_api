require_relative "../canvas_base_input_type"
require_relative "sis_import_count"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasSisImportDatumInput < BaseInputObject
        description "SIS Imports. API Docs: https://canvas.instructure.com/doc/api/sis_imports.html"
      	argument :import_type, String, "The type of SIS import.Example: instructure_csv", required: false
      	argument :supplied_batches, String, "Which files were included in the SIS import.Example: term, course, section, user, enrollment", required: false
      	argument :counts, LMSGraphQL::Types::Canvas::CanvasSisImportCountInput, "The number of rows processed for each type of import.", required: false

      end
    end
  end
end