require_relative "../canvas_base_type"
require_relative "file"
require_relative "report_parameter"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasReport < BaseType
        description "Account Reports. API Docs: https://canvas.instructure.com/doc/api/account_reports.html"
        field :id, ID, "The unique identifier for the report..Example: 1", null: true
        field :report, String, "The type of report..Example: sis_export_csv", null: true
        field :file_url, String, "The url to the report download..Example: https://example.com/some/path", null: true
        field :attachment, LMSGraphQL::Types::Canvas::CanvasFile, "The attachment api object of the report. Only available after the report has completed..", null: true
        field :status, String, "The status of the report.Example: complete", null: true
        field :created_at, LMSGraphQL::Types::DateTimeType, "The date and time the report was created..Example: 2013-12-01T23:59:00-06:00", null: true
        field :started_at, LMSGraphQL::Types::DateTimeType, "The date and time the report started processing..Example: 2013-12-02T00:03:21-06:00", null: true
        field :ended_at, LMSGraphQL::Types::DateTimeType, "The date and time the report finished processing..Example: 2013-12-02T00:03:21-06:00", null: true
        field :parameters, LMSGraphQL::Types::Canvas::CanvasReportParameter, "The report parameters.Example: 2, 2012-07-13T10:55:20-06:00, 2012-07-13T10:55:20-06:00", null: true
        field :progress, Int, "The progress of the report.Example: 100", null: true
        field :current_line, Int, "This is the current line count being written to the report. It updates every 1000 records..Example: 12000", null: true

      end
    end
  end
end