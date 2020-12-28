require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class UpdatePreferencesByCategory < BaseMutation
        argument :communication_channel_id, ID, required: true
        argument :category, String, required: true
        argument :notification_preferences_frequency, String, required: true
        
        
        field :return_value, Boolean, null: false
        
        def resolve(communication_channel_id:, category:, notification_preferences_frequency:)
          context[:canvas_api].call("UPDATE_PREFERENCES_BY_CATEGORY").proxy(
            "UPDATE_PREFERENCES_BY_CATEGORY",
            {
              "communication_channel_id": communication_channel_id,
              "category": category
            },
            {
              "notification_preferences[frequency]": notification_preferences_frequency
            },
          ).parsed_response
        end
      end
    end
  end
end