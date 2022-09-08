require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class CreateScore < BaseMutation
        argument :course_id, ID, required: true
        argument :line_item_id, ID, required: true
        argument :userId, String, required: true
        argument :activityProgress, String, required: true
        argument :gradingProgress, String, required: true
        argument :timestamp, String, required: true
        argument :scoreGiven, Float, required: false
        argument :scoreMaximum, Float, required: false
        argument :comment, String, required: false
        argument :lti_submission, String, required: false
        argument :lti_submission_new_submission, Boolean, required: false
        argument :lti_submission_prioritize_non_tool_grade, Boolean, required: false
        argument :lti_submission_submission_type, String, required: false
        argument :lti_submission_submission_data, String, required: false
        argument :lti_submission_submitted_at, String, required: false
        argument :lti_submission_content_items, [String], required: false
        
        
        field :return_value, String, null: false
        
        def resolve(course_id:, line_item_id:, userId:, activityProgress:, gradingProgress:, timestamp:, scoreGiven: nil, scoreMaximum: nil, comment: nil, lti_submission: nil, lti_submission_new_submission: nil, lti_submission_prioritize_non_tool_grade: nil, lti_submission_submission_type: nil, lti_submission_submission_data: nil, lti_submission_submitted_at: nil, lti_submission_content_items: nil)
          context[:canvas_api].call("CREATE_SCORE").proxy(
            "CREATE_SCORE",
            {
              "course_id": course_id,
              "line_item_id": line_item_id
            },
            {
              "userId": userId,
              "activityProgress": activityProgress,
              "gradingProgress": gradingProgress,
              "timestamp": timestamp,
              "scoreGiven": scoreGiven,
              "scoreMaximum": scoreMaximum,
              "comment": comment,
              "https://canvas.instructure.com/lti/submission": lti_submission,
              "https://canvas.instructure.com/lti/submission[new_submission]": lti_submission_new_submission,
              "https://canvas.instructure.com/lti/submission[prioritize_non_tool_grade]": lti_submission_prioritize_non_tool_grade,
              "https://canvas.instructure.com/lti/submission[submission_type]": lti_submission_submission_type,
              "https://canvas.instructure.com/lti/submission[submission_data]": lti_submission_submission_data,
              "https://canvas.instructure.com/lti/submission[submitted_at]": lti_submission_submitted_at,
              "https://canvas.instructure.com/lti/submission[content_items]": lti_submission_content_items
            },
          ).parsed_response
        end
      end
    end
  end
end