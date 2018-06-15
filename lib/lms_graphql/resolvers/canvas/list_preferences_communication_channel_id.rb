require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/notification_preference"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListPreferencesCommunicationChannelId < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasNotificationPreference], null: false
        argument :user_id, ID, required: true
        argument :communication_channel_id, ID, required: true
        def resolve(user_id:, communication_channel_id:)
          context[:canvas_api].call("LIST_PREFERENCES_COMMUNICATION_CHANNEL_ID").proxy(
            "LIST_PREFERENCES_COMMUNICATION_CHANNEL_ID",
            {
              "user_id": user_id,
              "communication_channel_id": communication_channel_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end