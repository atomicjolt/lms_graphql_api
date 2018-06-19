require_relative "../canvas_base_input_type"
require_relative "tool_setting_input"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasOriginalityReportInput < BaseInputObject
        description "Originality Reports. API Docs: https://canvas.instructure.com/doc/api/originality_reports.html"
        argument :id, ID, "The id of the OriginalityReport.Example: 4", required: false
        argument :file_id, ID, "The id of the file receiving the originality score.Example: 8", required: false
        argument :originality_score, Float, "A number between 0 and 100 representing the originality score.Example: 0.16", required: false
        argument :originality_report_file_id, ID, "The ID of the file within Canvas containing the originality report document (if provided).Example: 23", required: false
        argument :originality_report_url, String, "A non-LTI launch URL where the originality score of the file may be found..Example: http://www.example.com/report", required: false
        argument :tool_setting, String, "A ToolSetting object containing optional 'resource_type_code' and 'resource_url'.", required: false

      end
    end
  end
end