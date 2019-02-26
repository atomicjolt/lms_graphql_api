require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class CreateQuizSubmissionStartQuizTakingSession < BaseMutation
        argument :course_id, ID, required: true
        argument :quiz_id, ID, required: true
        argument :access_code, String, required: false
        argument :preview, Boolean, required: false
        field :return_value, Boolean, null: false
        def resolve(course_id:, quiz_id:, access_code: nil, preview: nil)
          context[:canvas_api].call("CREATE_QUIZ_SUBMISSION_START_QUIZ_TAKING_SESSION").proxy(
            "CREATE_QUIZ_SUBMISSION_START_QUIZ_TAKING_SESSION",
            {
              "course_id": course_id,
              "quiz_id": quiz_id
            },
            {
              "access_code": access_code,
              "preview": preview
            },
          ).parsed_response
        end
      end
    end
  end
end