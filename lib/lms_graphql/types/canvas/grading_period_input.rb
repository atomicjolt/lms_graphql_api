require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasGradingPeriodInput < BaseInputObject
        description "Grading Periods. API Docs: https://canvas.instructure.com/doc/api/grading_periods.html"
        argument :id, ID, "The unique identifier for the grading period..Example: 1023", required: false
        argument :title, String, "The title for the grading period..Example: First Block", required: false
        argument :start_date, String, "The start date of the grading period..Example: 2014-01-07T15:04:00Z", required: false
        argument :end_date, String, "The end date of the grading period..Example: 2014-05-07T17:07:00Z", required: false
        argument :close_date, String, "Grades can only be changed before the close date of the grading period..Example: 2014-06-07T17:07:00Z", required: false
        argument :weight, Int, "A weight value that contributes to the overall weight of a grading period set which is used to calculate how much assignments in this period contribute to the total grade.Example: 33.33", required: false
        argument :is_closed, Boolean, "If true, the grading period's close_date has passed..Example: true", required: false

      end
    end
  end
end