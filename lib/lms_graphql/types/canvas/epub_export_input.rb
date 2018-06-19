require_relative "../canvas_base_input_type"
require_relative "file"

module LMSGraphQL
  module Types
    module Canvas
        class EpubExportWorkflowStateEnum < ::GraphQL::Schema::Enum
          value "created"
          value "exporting"
          value "exported"
          value "generating"
          value "generated"
          value "failed"
        end
      class CanvasEpubExportInput < BaseInputObject
        description "ePub Exports. API Docs: https://canvas.instructure.com/doc/api/e_pub_exports.html"
        argument :id, ID, "the unique identifier for the export.Example: 101", required: false
        argument :created_at, LMSGraphQL::Types::DateTimeType, "the date and time this export was requested.Example: 2014-01-01T00:00:00Z", required: false
        argument :attachment, LMSGraphQL::Types::Canvas::CanvasFileInput, "attachment api object for the export ePub (not present until the export completes).Example: https://example.com/api/v1/attachments/789?download_frd=1&verifier=bG9sY2F0cyEh", required: false
        argument :progress_url, String, "The api endpoint for polling the current progress.Example: https://example.com/api/v1/progress/4", required: false
        argument :user_id, ID, "The ID of the user who started the export.Example: 4", required: false
        argument :workflow_state, EpubExportWorkflowStateEnum, "Current state of the ePub export: created exporting exported generating generated failed.Example: exported", required: false

      end
    end
  end
end