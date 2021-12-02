require_relative "../canvas_base_type"
require_relative "sis_import_datum"
require_relative "sis_import_statistic"
require_relative "file"
require_relative "user"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasSisImport < BaseType
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
        description "SIS Imports. API Docs: https://canvas.instructure.com/doc/api/sis_imports.html"
        field :id, ID, "The unique identifier for the SIS import..Example: 1", null: true
        field :created_at, LMSGraphQL::Types::DateTimeType, "The date the SIS import was created..Example: 2013-12-01T23:59:00-06:00", null: true
        field :ended_at, LMSGraphQL::Types::DateTimeType, "The date the SIS import finished. Returns null if not finished..Example: 2013-12-02T00:03:21-06:00", null: true
        field :updated_at, LMSGraphQL::Types::DateTimeType, "The date the SIS import was last updated..Example: 2013-12-02T00:03:21-06:00", null: true
        field :workflow_state, SisImportWorkflowStateEnum, "The current state of the SIS import.
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
 - 'restored': The SIS import is restored all of the states of imported items..Example: imported", null: true
        field :data, LMSGraphQL::Types::Canvas::CanvasSisImportDatum, "data.", null: true
        field :statistics, LMSGraphQL::Types::Canvas::CanvasSisImportStatistic, "statistics.", null: true
        field :progress, String, "The progress of the SIS import. The progress will reset when using batch_mode and have a different progress for the cleanup stage.Example: 100", null: true
        field :errors_attachment, LMSGraphQL::Types::Canvas::CanvasFile, "The errors_attachment api object of the SIS import. Only available if there are errors or warning and import has completed..", null: true
        field :user, LMSGraphQL::Types::Canvas::CanvasUser, "The user that initiated the sis_batch. See the Users API for details..", null: true
        field :processing_warnings, [String], "Only imports that are complete will get this data. An array of CSV_file/warning_message pairs..Example: students.csv, user John Doe has already claimed john_doe's requested login information, skipping", null: true
        field :processing_errors, [String], "An array of CSV_file/error_message pairs..Example: students.csv, Error while importing CSV. Please contact support.", null: true
        field :batch_mode, Boolean, "Whether the import was run in batch mode..Example: true", null: true
        field :batch_mode_term_id, ID, "The term the batch was limited to..Example: 1234", null: true
        field :multi_term_batch_mode, Boolean, "Enables batch mode against all terms in term file. Requires change_threshold to be set..Example: false", null: true
        field :skip_deletes, Boolean, "When set the import will skip any deletes..Example: false", null: true
        field :override_sis_stickiness, Boolean, "Whether UI changes were overridden..Example: false", null: true
        field :add_sis_stickiness, Boolean, "Whether stickiness was added to the batch changes..Example: false", null: true
        field :clear_sis_stickiness, Boolean, "Whether stickiness was cleared..Example: false", null: true
        field :diffing_data_set_identifier, String, "The identifier of the data set that this SIS batch diffs against.Example: account-5-enrollments", null: true
        field :diffed_against_import_id, ID, "The ID of the SIS Import that this import was diffed against.Example: 1", null: true
        field :csv_attachments, [String], "An array of CSV files for processing.", null: true

      end
    end
  end
end