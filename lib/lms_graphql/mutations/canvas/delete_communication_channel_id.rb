require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/communication_channel"
module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteCommunicationChannelId < BaseMutation
        argument :user_id, ID, required: true
        argument :id, ID, required: true
        field :communication_channel, LMSGraphQL::Types::Canvas::CanvasCommunicationChannel, null: false
        def resolve(user_id:, id:)
          context[:canvas_api].call("DELETE_COMMUNICATION_CHANNEL_ID").proxy(
            "DELETE_COMMUNICATION_CHANNEL_ID",
            {
              "user_id": user_id,
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end