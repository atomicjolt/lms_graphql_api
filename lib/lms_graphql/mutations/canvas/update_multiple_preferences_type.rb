require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateMultiplePreferencesType < BaseMutation
        argument :type, String, required: true
        argument :address, String, required: true
        argument :notification_preferences__X__frequency, String, required: true
        
        
        field :return_value, Boolean, null: false
        
        def resolve(type:, address:, notification_preferences__X__frequency:)
          context[:canvas_api].call("UPDATE_MULTIPLE_PREFERENCES_TYPE").proxy(
            "UPDATE_MULTIPLE_PREFERENCES_TYPE",
            {
              "type": type,
              "address": address
            },
            {
              "notification_preferences[<X>][frequency]": notification_preferences__X__frequency
            },
          ).parsed_response
        end
      end
    end
  end
end