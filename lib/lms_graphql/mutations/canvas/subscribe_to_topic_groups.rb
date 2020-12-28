require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class SubscribeToTopicGroup < BaseMutation
        argument :group_id, ID, required: true
        argument :topic_id, ID, required: true
        
        
        field :return_value, Boolean, null: false
        
        def resolve(group_id:, topic_id:)
          context[:canvas_api].call("SUBSCRIBE_TO_TOPIC_GROUPS").proxy(
            "SUBSCRIBE_TO_TOPIC_GROUPS",
            {
              "group_id": group_id,
              "topic_id": topic_id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end