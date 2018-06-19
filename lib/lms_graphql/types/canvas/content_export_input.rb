require_relative "../canvas_base_input_type"
require_relative "file_input"

module LMSGraphQL
  module Types
    module Canvas
        class ContentExportExportTypeEnum < ::GraphQL::Schema::Enum
          value "common_cartridge"
          value "qti"
        end

                class ContentExportWorkflowStateEnum < ::GraphQL::Schema::Enum
          value "created"
          value "exporting"
          value "exported"
          value "failed"
        end
      class CanvasContentExportInput < BaseInputObject
        description "Content Exports. API Docs: https://canvas.instructure.com/doc/api/content_exports.html"
        argument :id, ID, "the unique identifier for the export.Example: 101", required: false
        argument :created_at, LMSGraphQL::Types::DateTimeType, "the date and time this export was requested.Example: 2014-01-01T00:00:00Z", required: false
        argument :export_type, ContentExportExportTypeEnum, "the type of content migration: 'common_cartridge' or 'qti'.Example: common_cartridge", required: false
        argument :attachment, LMSGraphQL::Types::Canvas::CanvasFileInput, "attachment api object for the export package (not present before the export completes or after it becomes unavailable for download.).Example: https://example.com/api/v1/attachments/789?download_frd=1&verifier=bG9sY2F0cyEh", required: false
        argument :progress_url, String, "The api endpoint for polling the current progress.Example: https://example.com/api/v1/progress/4", required: false
        argument :user_id, ID, "The ID of the user who started the export.Example: 4", required: false
        argument :workflow_state, ContentExportWorkflowStateEnum, "Current state of the content migration: created exporting exported failed.Example: exported", required: false

      end
    end
  end
end