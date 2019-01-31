require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/notification_preference"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetPreferenceType < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasNotificationPreference, null: false
        argument :user_id, ID, required: true
        argument :type, String, required: true
        argument :address, String, required: true
        argument :notification, String, required: true
        def resolve(user_id:, type:, address:, notification:, get_all: false)
          result = context[:canvas_api].call("GET_PREFERENCE_TYPE").proxy(
            "GET_PREFERENCE_TYPE",
            {
              "user_id": user_id,
              "type": type,
              "address": address,
              "notification": notification            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end