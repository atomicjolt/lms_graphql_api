require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/progress"
module LMSGraphQL
  module Mutations
    module Canvas
      class BatchUpdateConversation < BaseMutation
        argument :conversation_ids, [ID], required: true
        argument :event, String, required: true
        field :progress, LMSGraphQL::Types::Canvas::CanvasProgress, null: false
        def resolve(conversation_ids:, event:)
          context[:canvas_api].call("BATCH_UPDATE_CONVERSATIONS").proxy(
            "BATCH_UPDATE_CONVERSATIONS",
            {
              "conversation_ids": conversation_ids,
              "event": event            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end