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
        argument :submission, String, required: false
        argument :submission_new_submission, Boolean, required: false
        argument :submission_prioritize_non_tool_grade, Boolean, required: false
        argument :submission_submission_type, String, required: false
        argument :submission_submission_data, String, required: false
        argument :submission_submitted_at, String, required: false
        argument :submission_content_items, [String], required: false
        
        
        field :return_value, String, null: false
        
        def resolve(course_id:, line_item_id:, userId:, activityProgress:, gradingProgress:, timestamp:, scoreGiven: nil, scoreMaximum: nil, comment: nil, submission: nil, submission_new_submission: nil, submission_prioritize_non_tool_grade: nil, submission_submission_type: nil, submission_submission_data: nil, submission_submitted_at: nil, submission_content_items: nil)
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
              "https://canvas.instructure.com/lti/submission": submission,
              "https://canvas.instructure.com/lti/submission[new_submission]": submission_new_submission,
              "https://canvas.instructure.com/lti/submission[prioritize_non_tool_grade]": submission_prioritize_non_tool_grade,
              "https://canvas.instructure.com/lti/submission[submission_type]": submission_submission_type,
              "https://canvas.instructure.com/lti/submission[submission_data]": submission_submission_data,
              "https://canvas.instructure.com/lti/submission[submitted_at]": submission_submitted_at,
              "https://canvas.instructure.com/lti/submission[content_items]": submission_content_items
            },
          ).parsed_response
        end
      end
    end
  end
end