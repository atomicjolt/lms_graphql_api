require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasLatePolicyInput < BaseInputObject
          description "Late Policy. API Docs: https://canvas.instructure.com/doc/api/late_policy.html"
        argument :id, ID, "the unique identifier for the late policy.Example: 123", required: false
        argument :course_id, ID, "the unique identifier for the course.Example: 123", required: false
        argument :missing_submission_deduction_enabled, Boolean, "whether to enable missing submission deductions.Example: true", required: false
        argument :missing_submission_deduction, Float, "amount of percentage points to deduct.Example: 12.34", required: false
        argument :late_submission_deduction_enabled, Boolean, "whether to enable late submission deductions.Example: true", required: false
        argument :late_submission_deduction, Float, "amount of percentage points to deduct per late_submission_interval.Example: 12.34", required: false
        argument :late_submission_interval, String, "time interval for late submission deduction.Example: hour", required: false
        argument :late_submission_minimum_percent_enabled, Boolean, "whether to enable late submission minimum percent.Example: true", required: false
        argument :late_submission_minimum_percent, Float, "the minimum score a submission can receive in percentage points.Example: 12.34", required: false
        argument :created_at, GraphQL::Types::ISO8601DateTime, "the time at which this late policy was originally created.Example: 2012-07-01T23:59:00-06:00", required: false
        argument :updated_at, GraphQL::Types::ISO8601DateTime, "the time at which this late policy was last modified in any way.Example: 2012-07-01T23:59:00-06:00", required: false

      end
    end
  end
end