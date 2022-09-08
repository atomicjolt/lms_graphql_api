require_relative "../canvas_base_input_type"
require_relative "file"
require_relative "report_parameter"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasReportInput < BaseInputObject
          description "Account Reports. API Docs: https://canvas.instructure.com/doc/api/account_reports.html"
        argument :id, ID, "The unique identifier for the report..Example: 1", required: false
        argument :report, String, "The type of report..Example: sis_export_csv", required: false
        argument :file_url, String, "The url to the report download..Example: https://example.com/some/path", required: false
        argument :attachment, LMSGraphQL::Types::Canvas::CanvasFileInput, "The attachment api object of the report. Only available after the report has completed..", required: false
        argument :status, String, "The status of the report.Example: complete", required: false
        argument :created_at, GraphQL::Types::ISO8601DateTime, "The date and time the report was created..Example: 2013-12-01T23:59:00-06:00", required: false
        argument :started_at, GraphQL::Types::ISO8601DateTime, "The date and time the report started processing..Example: 2013-12-02T00:03:21-06:00", required: false
        argument :ended_at, GraphQL::Types::ISO8601DateTime, "The date and time the report finished processing..Example: 2013-12-02T00:03:21-06:00", required: false
        argument :parameters, LMSGraphQL::Types::Canvas::CanvasReportParameterInput, "The report parameters.Example: 2, 2012-07-13T10:55:20-06:00, 2012-07-13T10:55:20-06:00", required: false
        argument :progress, Int, "The progress of the report.Example: 100", required: false
        argument :current_line, Int, "This is the current line count being written to the report. It updates every 1000 records..Example: 12000", required: false

      end
    end
  end
end