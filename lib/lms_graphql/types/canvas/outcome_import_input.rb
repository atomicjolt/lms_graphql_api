require_relative "../canvas_base_input_type"
require_relative "outcome_import_datum"
require_relative "user"

module LMSGraphQL
  module Types
    module Canvas
        class OutcomeImportWorkflowStateEnum < ::GraphQL::Schema::Enum
          value "created"
          value "importing"
          value "succeeded"
          value "failed"
        end
      class CanvasOutcomeImportInput < BaseInputObject
        description "Outcome Imports. API Docs: https://canvas.instructure.com/doc/api/outcome_imports.html"
      	argument :id, ID, "The unique identifier for the outcome import..Example: 1", required: false
      	argument :created_at, LMSGraphQL::Types::DateTimeType, "The date the outcome import was created..Example: 2013-12-01T23:59:00-06:00", required: false
      	argument :ended_at, LMSGraphQL::Types::DateTimeType, "The date the outcome import finished. Returns null if not finished..Example: 2013-12-02T00:03:21-06:00", required: false
      	argument :updated_at, LMSGraphQL::Types::DateTimeType, "The date the outcome import was last updated..Example: 2013-12-02T00:03:21-06:00", required: false
      	argument :workflow_state, OutcomeImportWorkflowStateEnum, "The current state of the outcome import.
 - 'created': The outcome import has been created.
 - 'importing': The outcome import is currently processing.
 - 'succeeded': The outcome import has completed successfully.
 - 'failed': The outcome import failed..Example: imported", required: false
      	argument :data, LMSGraphQL::Types::Canvas::CanvasOutcomeImportDatumInput, "See the OutcomeImportData specification above..", required: false
      	argument :progress, String, "The progress of the outcome import..Example: 100", required: false
      	argument :user, LMSGraphQL::Types::Canvas::CanvasUserInput, "The user that initiated the outcome_import. See the Users API for details..", required: false
      	argument :processing_errors, String, "An array of row number / error message pairs. Returns the first 25 errors..Example: 1, Missing required fields: title", required: false

      end
    end
  end
end