require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/originality_report"
module LMSGraphQL
  module Mutations
    module Canvas
      class CreateOriginalityReport < BaseMutation
        argument :assignment_id, ID, required: true
        argument :submission_id, ID, required: true
        argument :originality_report_file_id, Int, required: false
        argument :originality_report_originality_score, Float, required: true
        argument :originality_report_originality_report_url, String, required: false
        argument :originality_report_originality_report_file_id, Int, required: false
        argument :originality_report_tool_setting_resource_type_code, String, required: false
        argument :originality_report_tool_setting_resource_url, String, required: false
        argument :originality_report_workflow_state, String, required: false
        argument :originality_report_error_message, String, required: false
        argument :originality_report_attempt, Int, required: false
        
        
        field :originality_report, LMSGraphQL::Types::Canvas::CanvasOriginalityReport, null: false
        
        def resolve(assignment_id:, submission_id:, originality_report_file_id: nil, originality_report_originality_score:, originality_report_originality_report_url: nil, originality_report_originality_report_file_id: nil, originality_report_tool_setting_resource_type_code: nil, originality_report_tool_setting_resource_url: nil, originality_report_workflow_state: nil, originality_report_error_message: nil, originality_report_attempt: nil)
          context[:canvas_api].call("CREATE_ORIGINALITY_REPORT").proxy(
            "CREATE_ORIGINALITY_REPORT",
            {
              "assignment_id": assignment_id,
              "submission_id": submission_id
            },
            {
              "originality_report[file_id]": originality_report_file_id,
              "originality_report[originality_score]": originality_report_originality_score,
              "originality_report[originality_report_url]": originality_report_originality_report_url,
              "originality_report[originality_report_file_id]": originality_report_originality_report_file_id,
              "originality_report[tool_setting][resource_type_code]": originality_report_tool_setting_resource_type_code,
              "originality_report[tool_setting][resource_url]": originality_report_tool_setting_resource_url,
              "originality_report[workflow_state]": originality_report_workflow_state,
              "originality_report[error_message]": originality_report_error_message,
              "originality_report[attempt]": originality_report_attempt
            },
          ).parsed_response
        end
      end
    end
  end
end