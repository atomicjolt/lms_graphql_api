require_relative "../canvas_base_type"
require_relative "tool_setting"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasOriginalityReport < BaseType
        description "Originality Reports. API Docs: https://canvas.instructure.com/doc/api/originality_reports.html"
      	field :id, ID, "The id of the OriginalityReport.Example: 4", null: true
      	field :file_id, ID, "The id of the file receiving the originality score.Example: 8", null: true
      	field :originality_score, Float, "A number between 0 and 100 representing the originality score.Example: 0.16", null: true
      	field :originality_report_file_id, ID, "The ID of the file within Canvas containing the originality report document (if provided).Example: 23", null: true
      	field :originality_report_url, String, "A non-LTI launch URL where the originality score of the file may be found..Example: http://www.example.com/report", null: true
      	field :tool_setting, LMSGraphQL::Types::Canvas::CanvasToolSetting, "A ToolSetting object containing optional 'resource_type_code' and 'resource_url'.", null: true
      	field :error_report, String, "A message describing the error. If set, the workflow_state will become 'error.'.", null: true
      	field :submission_time, LMSGraphQL::Types::DateTimeType, "The submitted_at date time of the submission..", null: true
      	field :root_account_id, ID, "The id of the root Account associated with the OriginalityReport.Example: 1", null: true

      end
    end
  end
end