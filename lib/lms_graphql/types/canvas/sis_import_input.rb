require_relative "../canvas_base_input_type"
require_relative "sis_import_datum"
require_relative "sis_import_statistic"
require_relative "file"
require_relative "user"

module LMSGraphQL
  module Types
    module Canvas
        class SisImportWorkflowStateEnum < ::GraphQL::Schema::Enum
          value "initializing"
          value "created"
          value "importing"
          value "cleanup_batch"
          value "imported"
          value "imported_with_messages"
          value "aborted"
          value "failed"
          value "failed_with_messages"
          value "restoring"
          value "partially_restored"
          value "restored"
        end
      class CanvasSisImportInput < BaseInputObject
        description "SIS Imports. API Docs: https://canvas.instructure.com/doc/api/sis_imports.html"
        argument :id, ID, "The unique identifier for the SIS import..Example: 1", required: false
        argument :created_at, LMSGraphQL::Types::DateTimeType, "The date the SIS import was created..Example: 2013-12-01T23:59:00-06:00", required: false
        argument :ended_at, LMSGraphQL::Types::DateTimeType, "The date the SIS import finished. Returns null if not finished..Example: 2013-12-02T00:03:21-06:00", required: false
        argument :updated_at, LMSGraphQL::Types::DateTimeType, "The date the SIS import was last updated..Example: 2013-12-02T00:03:21-06:00", required: false
        argument :workflow_state, SisImportWorkflowStateEnum, "The current state of the SIS import.
 - 'initializing': The SIS import is being created, if this gets stuck in initializing, it will not import and will continue on to next import.
 - 'created': The SIS import has been created.
 - 'importing': The SIS import is currently processing.
 - 'cleanup_batch': The SIS import is currently cleaning up courses, sections, and enrollments not included in the batch for batch_mode imports.
 - 'imported': The SIS import has completed successfully.
 - 'imported_with_messages': The SIS import completed with errors or warnings.
 - 'aborted': The SIS import was aborted.
 - 'failed_with_messages': The SIS import failed with errors.
 - 'failed': The SIS import failed.
 - 'restoring': The SIS import is restoring states of imported items.
 - 'partially_restored': The SIS import is restored some of the states of imported items. This is generally due to passing a param like undelete only.
 - 'restored': The SIS import is restored all of the states of imported items..Example: imported", required: false
        argument :data, LMSGraphQL::Types::Canvas::CanvasSisImportDatumInput, "data.", required: false
        argument :statistics, LMSGraphQL::Types::Canvas::CanvasSisImportStatisticInput, "statistics.", required: false
        argument :progress, String, "The progress of the SIS import. The progress will reset when using batch_mode and have a different progress for the cleanup stage.Example: 100", required: false
        argument :errors_attachment, LMSGraphQL::Types::Canvas::CanvasFileInput, "The errors_attachment api object of the SIS import. Only available if there are errors or warning and import has completed..", required: false
        argument :user, LMSGraphQL::Types::Canvas::CanvasUserInput, "The user that initiated the sis_batch. See the Users API for details..", required: false
        argument :processing_warnings, String, "Only imports that are complete will get this data. An array of CSV_file/warning_message pairs..Example: students.csv, user John Doe has already claimed john_doe's requested login information, skipping", required: false
        argument :processing_errors, String, "An array of CSV_file/error_message pairs..Example: students.csv, Error while importing CSV. Please contact support.", required: false
        argument :batch_mode, Boolean, "Whether the import was run in batch mode..Example: true", required: false
        argument :batch_mode_term_id, ID, "The term the batch was limited to..Example: 1234", required: false
        argument :multi_term_batch_mode, Boolean, "Enables batch mode against all terms in term file. Requires change_threshold to be set..Example: false", required: false
        argument :skip_deletes, Boolean, "When set the import will skip any deletes..Example: false", required: false
        argument :override_sis_stickiness, Boolean, "Whether UI changes were overridden..Example: false", required: false
        argument :add_sis_stickiness, Boolean, "Whether stickiness was added to the batch changes..Example: false", required: false
        argument :clear_sis_stickiness, Boolean, "Whether stickiness was cleared..Example: false", required: false
        argument :diffing_data_set_identifier, String, "The identifier of the data set that this SIS batch diffs against.Example: account-5-enrollments", required: false
        argument :diffed_against_import_id, ID, "The ID of the SIS Import that this import was diffed against.Example: 1", required: false
        argument :csv_attachments, String, "An array of CSV files for processing.", required: false

      end
    end
  end
end