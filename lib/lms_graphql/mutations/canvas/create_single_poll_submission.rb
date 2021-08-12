require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class CreateSinglePollSubmission < BaseMutation
        argument :poll_id, ID, required: true
        argument :poll_session_id, ID, required: true
        argument :poll_submissions_poll_choice_id, [Int], required: true
        
        
        field :return_value, Boolean, null: false
        
        def resolve(poll_id:, poll_session_id:, poll_submissions_poll_choice_id:)
          context[:canvas_api].call("CREATE_SINGLE_POLL_SUBMISSION").proxy(
            "CREATE_SINGLE_POLL_SUBMISSION",
            {
              "poll_id": poll_id,
              "poll_session_id": poll_session_id
            },
            {
              "poll_submissions[poll_choice_id]": poll_submissions_poll_choice_id
            },
          ).parsed_response
        end
      end
    end
  end
end