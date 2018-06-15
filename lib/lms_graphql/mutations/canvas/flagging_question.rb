require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class FlaggingQuestion < BaseMutation
        argument :quiz_submission_id, ID, required: true
        argument :id, ID, required: true
        argument :attempt, Int, required: true
        argument :validation_token, String, required: true
        argument :access_code, String, required: false
        field :return_value, Boolean, null: false
        def resolve(quiz_submission_id:, id:, attempt:, validation_token:, access_code: nil)
          context[:canvas_api].call("FLAGGING_QUESTION").proxy(
            "FLAGGING_QUESTION",
            {
              "quiz_submission_id": quiz_submission_id,
              "id": id,
              "attempt": attempt,
              "validation_token": validation_token,
              "access_code": access_code            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end