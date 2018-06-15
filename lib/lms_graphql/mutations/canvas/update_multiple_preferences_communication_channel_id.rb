require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateMultiplePreferencesCommunicationChannelId < CanvasBaseMutation
        argument :communication_channel_id, ID, required: true
        argument :notification_preferences__x__frequency, String, required: true
        field :return_value, Boolean, null: false
        def resolve(communication_channel_id:, notification_preferences__x__frequency:)
          context[:canvas_api].call("UPDATE_MULTIPLE_PREFERENCES_COMMUNICATION_CHANNEL_ID").proxy(
            "UPDATE_MULTIPLE_PREFERENCES_COMMUNICATION_CHANNEL_ID",
            {
              "communication_channel_id": communication_channel_id,
              "notification_preferences[<X>][frequency]": notification_preferences__x__frequency            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end