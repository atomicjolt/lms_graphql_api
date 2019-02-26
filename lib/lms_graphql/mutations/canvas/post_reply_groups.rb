require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class PostReplyGroup < BaseMutation
        argument :group_id, ID, required: true
        argument :topic_id, ID, required: true
        argument :entry_id, ID, required: true
        argument :message, String, required: false
        argument :attachment, String, required: false
        field :return_value, Boolean, null: false
        def resolve(group_id:, topic_id:, entry_id:, message: nil, attachment: nil)
          context[:canvas_api].call("POST_REPLY_GROUPS").proxy(
            "POST_REPLY_GROUPS",
            {
              "group_id": group_id,
              "topic_id": topic_id,
              "entry_id": entry_id
            },
            {
              "message": message,
              "attachment": attachment
            },
          ).parsed_response
        end
      end
    end
  end
end