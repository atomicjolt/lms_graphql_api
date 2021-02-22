require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/discussion_topic"
module LMSGraphQL
  module Mutations
    module Canvas
      class DuplicateDiscussionTopicGroup < BaseMutation
        argument :group_id, ID, required: true
        argument :topic_id, ID, required: true
        
        
        field :discussion_topic, LMSGraphQL::Types::Canvas::CanvasDiscussionTopic, null: false
        
        def resolve(group_id:, topic_id:)
          context[:canvas_api].call("DUPLICATE_DISCUSSION_TOPIC_GROUPS").proxy(
            "DUPLICATE_DISCUSSION_TOPIC_GROUPS",
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