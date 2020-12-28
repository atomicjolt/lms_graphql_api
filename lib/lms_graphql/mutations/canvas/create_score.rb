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
        
        
        field :return_value, String, null: false
        
        def resolve(course_id:, line_item_id:, userId:, activityProgress:, gradingProgress:, timestamp:, scoreGiven: nil, scoreMaximum: nil, comment: nil, submission: nil)
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
              "https://canvas.instructure.com/lti/submission": submission
            },
          ).parsed_response
        end
      end
    end
  end
end