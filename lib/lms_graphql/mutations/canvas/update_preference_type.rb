require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class UpdatePreferenceType < BaseMutation
        argument :type, String, required: true
        argument :address, String, required: true
        argument :notification, String, required: true
        argument :notification_preferences_frequency, String, required: true
        
        
        field :return_value, Boolean, null: false
        
        def resolve(type:, address:, notification:, notification_preferences_frequency:)
          context[:canvas_api].call("UPDATE_PREFERENCE_TYPE").proxy(
            "UPDATE_PREFERENCE_TYPE",
            {
              "type": type,
              "address": address,
              "notification": notification
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