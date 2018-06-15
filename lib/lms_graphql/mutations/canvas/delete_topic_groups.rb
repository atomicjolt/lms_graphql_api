require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteTopicGroup < CanvasBaseMutation
        argument :group_id, ID, required: true
        argument :topic_id, ID, required: true
        field :return_value, Boolean, null: false
        def resolve(group_id:, topic_id:)
          context[:canvas_api].call("DELETE_TOPIC_GROUPS").proxy(
            "DELETE_TOPIC_GROUPS",
            {
              "group_id": group_id,
              "topic_id": topic_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end