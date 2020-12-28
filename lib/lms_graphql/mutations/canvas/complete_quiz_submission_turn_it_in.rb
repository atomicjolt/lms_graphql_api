require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class CompleteQuizSubmissionTurnItIn < BaseMutation
        argument :course_id, ID, required: true
        argument :quiz_id, ID, required: true
        argument :id, ID, required: true
        argument :attempt, Int, required: true
        argument :validation_token, String, required: true
        argument :access_code, String, required: false
        
        
        field :return_value, Boolean, null: false
        
        def resolve(course_id:, quiz_id:, id:, attempt:, validation_token:, access_code: nil)
          context[:canvas_api].call("COMPLETE_QUIZ_SUBMISSION_TURN_IT_IN").proxy(
            "COMPLETE_QUIZ_SUBMISSION_TURN_IT_IN",
            {
              "course_id": course_id,
              "quiz_id": quiz_id,
              "id": id
            },
            {
              "attempt": attempt,
              "validation_token": validation_token,
              "access_code": access_code
            },
          ).parsed_response
        end
      end
    end
  end
end