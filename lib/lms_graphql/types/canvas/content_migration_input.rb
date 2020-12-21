require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
        class ContentMigrationWorkflowStateEnum < ::GraphQL::Schema::Enum
          value "pre_processing"
          value "pre_processed"
          value "running"
          value "waiting_for_select"
          value "completed"
          value "failed"
        end
      class CanvasContentMigrationInput < BaseInputObject
        description "Content Migrations. API Docs: https://canvas.instructure.com/doc/api/content_migrations.html"
      	argument :id, ID, "the unique identifier for the migration.Example: 370663", required: false
      	argument :migration_type, String, "the type of content migration.Example: common_cartridge_importer", required: false
      	argument :migration_type_title, String, "the name of the content migration type.Example: Canvas Cartridge Importer", required: false
      	argument :migration_issues_url, String, "API url to the content migration's issues.Example: https://example.com/api/v1/courses/1/content_migrations/1/migration_issues", required: false
      	argument :attachment, String, "attachment api object for the uploaded file may not be present for all migrations.Example: {'url'=>'https://example.com/api/v1/courses/1/content_migrations/1/download_archive'}", required: false
      	argument :progress_url, String, "The api endpoint for polling the current progress.Example: https://example.com/api/v1/progress/4", required: false
      	argument :user_id, ID, "The user who started the migration.Example: 4", required: false
      	argument :workflow_state, ContentMigrationWorkflowStateEnum, "Current state of the content migration: pre_processing, pre_processed, running, waiting_for_select, completed, failed.Example: running", required: false
      	argument :started_at, LMSGraphQL::Types::DateTimeType, "timestamp.Example: 2012-06-01T00:00:00-06:00", required: false
      	argument :finished_at, LMSGraphQL::Types::DateTimeType, "timestamp.Example: 2012-06-01T00:00:00-06:00", required: false
      	argument :pre_attachment, String, "file uploading data, see {file:file_uploads.html File Upload Documentation} for file upload workflow This works a little differently in that all the file data is in the pre_attachment hash if there is no upload_url then there was an attachment pre-processing error, the error message will be in the message key This data will only be here after a create or update call.Example: {'upload_url'=>'', 'message'=>'file exceeded quota', 'upload_params'=>{}}", required: false

      end
    end
  end
end