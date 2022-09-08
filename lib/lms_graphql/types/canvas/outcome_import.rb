require_relative "../canvas_base_type"
require_relative "outcome_import_datum"
require_relative "user"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasOutcomeImport < BaseType
          class OutcomeImportWorkflowStateEnum < ::GraphQL::Schema::Enum
          value "created"
          value "importing"
          value "succeeded"
          value "failed"
        end
        description "Outcome Imports. API Docs: https://canvas.instructure.com/doc/api/outcome_imports.html"
        field :id, ID, "The unique identifier for the outcome import..Example: 1", null: true
        field :learning_outcome_group_id, ID, "The unique identifier for the group into which the outcomes will be imported to, or NULL..Example: 1", null: true
        field :created_at, GraphQL::Types::ISO8601DateTime, "The date the outcome import was created..Example: 2013-12-01T23:59:00-06:00", null: true
        field :ended_at, GraphQL::Types::ISO8601DateTime, "The date the outcome import finished. Returns null if not finished..Example: 2013-12-02T00:03:21-06:00", null: true
        field :updated_at, GraphQL::Types::ISO8601DateTime, "The date the outcome import was last updated..Example: 2013-12-02T00:03:21-06:00", null: true
        field :workflow_state, OutcomeImportWorkflowStateEnum, "The current state of the outcome import.
 - 'created': The outcome import has been created.
 - 'importing': The outcome import is currently processing.
 - 'succeeded': The outcome import has completed successfully.
 - 'failed': The outcome import failed..Example: imported", null: true
        field :data, LMSGraphQL::Types::Canvas::CanvasOutcomeImportDatum, "See the OutcomeImportData specification above..", null: true
        field :progress, String, "The progress of the outcome import..Example: 100", null: true
        field :user, LMSGraphQL::Types::Canvas::CanvasUser, "The user that initiated the outcome_import. See the Users API for details..", null: true
        field :processing_errors, [String], "An array of row number / error message pairs. Returns the first 25 errors..Example: 1, Missing required fields: title", null: true

      end
    end
  end
end