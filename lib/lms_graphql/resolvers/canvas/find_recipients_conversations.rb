require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class FindRecipientsConversation < CanvasBaseResolver
        type Boolean, null: false
        argument :search, String, required: false
        argument :context, String, required: false
        argument :exclude, String, required: false
        argument :type, String, required: false
        argument :user_id, ID, required: false
        argument :from_conversation_id, ID, required: false
        argument :permissions, String, required: false
        def resolve(search: nil, context: nil, exclude: nil, type: nil, user_id: nil, from_conversation_id: nil, permissions: nil)
          context[:canvas_api].call("FIND_RECIPIENTS_CONVERSATIONS").proxy(
            "FIND_RECIPIENTS_CONVERSATIONS",
            {
              "search": search,
              "context": context,
              "exclude": exclude,
              "type": type,
              "user_id": user_id,
              "from_conversation_id": from_conversation_id,
              "permissions": permissions            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end