require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class SendMessageToUnsubmittedOrSubmittedUsersForQuiz < BaseMutation
        argument :course_id, ID, required: true
        argument :id, ID, required: true
        argument :conversations, String, required: false
        
        
        field :return_value, Boolean, null: false
        
        def resolve(course_id:, id:, conversations: nil)
          context[:canvas_api].call("SEND_MESSAGE_TO_UNSUBMITTED_OR_SUBMITTED_USERS_FOR_QUIZ").proxy(
            "SEND_MESSAGE_TO_UNSUBMITTED_OR_SUBMITTED_USERS_FOR_QUIZ",
            {
              "course_id": course_id,
              "id": id
            },
            {
              "conversations": conversations
            },
          ).parsed_response
        end
      end
    end
  end
end