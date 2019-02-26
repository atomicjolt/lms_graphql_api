require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class EditConversation < BaseMutation
        argument :id, ID, required: true
        argument :conversation_workflow_state, String, required: false
        argument :conversation_subscribed, Boolean, required: false
        argument :conversation_starred, Boolean, required: false
        argument :scope, String, required: false
        argument :filter, String, required: false
        argument :filter_mode, String, required: false
        field :return_value, Boolean, null: false
        def resolve(id:, conversation_workflow_state: nil, conversation_subscribed: nil, conversation_starred: nil, scope: nil, filter: nil, filter_mode: nil)
          context[:canvas_api].call("EDIT_CONVERSATION").proxy(
            "EDIT_CONVERSATION",
            {
              "id": id
            },
            {
              "conversation[workflow_state]": conversation_workflow_state,
              "conversation[subscribed]": conversation_subscribed,
              "conversation[starred]": conversation_starred,
              "scope": scope,
              "filter": filter,
              "filter_mode": filter_mode
            },
          ).parsed_response
        end
      end
    end
  end
end