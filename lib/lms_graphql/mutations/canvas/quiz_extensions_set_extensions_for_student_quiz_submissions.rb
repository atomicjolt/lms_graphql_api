require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class QuizExtensionsSetExtensionsForStudentQuizSubmission < BaseMutation
        argument :course_id, ID, required: true
        argument :quiz_id, ID, required: true
        argument :quiz_extensions_user_id, [Int], required: true
        argument :quiz_extensions_extra_attempts, [Int], required: false
        argument :quiz_extensions_extra_time, [Int], required: false
        argument :quiz_extensions_manually_unlocked, [Boolean], required: false
        argument :quiz_extensions_extend_from_now, [Int], required: false
        argument :quiz_extensions_extend_from_end_at, [Int], required: false
        
        
        field :return_value, Boolean, null: false
        
        def resolve(course_id:, quiz_id:, quiz_extensions_user_id:, quiz_extensions_extra_attempts: nil, quiz_extensions_extra_time: nil, quiz_extensions_manually_unlocked: nil, quiz_extensions_extend_from_now: nil, quiz_extensions_extend_from_end_at: nil)
          context[:canvas_api].call("QUIZ_EXTENSIONS_SET_EXTENSIONS_FOR_STUDENT_QUIZ_SUBMISSIONS").proxy(
            "QUIZ_EXTENSIONS_SET_EXTENSIONS_FOR_STUDENT_QUIZ_SUBMISSIONS",
            {
              "course_id": course_id,
              "quiz_id": quiz_id
            },
            {
              "quiz_extensions[user_id]": quiz_extensions_user_id,
              "quiz_extensions[extra_attempts]": quiz_extensions_extra_attempts,
              "quiz_extensions[extra_time]": quiz_extensions_extra_time,
              "quiz_extensions[manually_unlocked]": quiz_extensions_manually_unlocked,
              "quiz_extensions[extend_from_now]": quiz_extensions_extend_from_now,
              "quiz_extensions[extend_from_end_at]": quiz_extensions_extend_from_end_at
            },
          ).parsed_response
        end
      end
    end
  end
end