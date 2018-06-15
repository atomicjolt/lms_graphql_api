require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/notification_preference"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetPreferenceCommunicationChannelId < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::NotificationPreference, null: false
        argument :user_id, ID, required: true
        argument :communication_channel_id, ID, required: true
        argument :notification, String, required: true
        def resolve(user_id:, communication_channel_id:, notification:)
          context[:canvas_api].proxy(
            "GET_PREFERENCE_COMMUNICATION_CHANNEL_ID",
            {
              "user_id": user_id,
              "communication_channel_id": communication_channel_id,
              "notification": notification            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end