require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/communication_channel"
module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteCommunicationChannelType < CanvasBaseMutation
        argument :user_id, ID, required: true
        argument :type, String, required: true
        argument :address, String, required: true
        field :communication_channel, LMSGraphQL::Types::Canvas::CanvasCommunicationChannel, null: false
        def resolve(user_id:, type:, address:)
          context[:canvas_api].call("DELETE_COMMUNICATION_CHANNEL_TYPE").proxy(
            "DELETE_COMMUNICATION_CHANNEL_TYPE",
            {
              "user_id": user_id,
              "type": type,
              "address": address            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end