require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/notification_preference"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListPreferencesType < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasNotificationPreference], null: false
        argument :get_all, Boolean, required: false
        argument :user_id, ID, required: true
        argument :type, String, required: true
        argument :address, String, required: true
        def resolve(user_id:, type:, address:, get_all: false)
          result = context[:canvas_api].call("LIST_PREFERENCES_TYPE").proxy(
            "LIST_PREFERENCES_TYPE",
            {
              "user_id": user_id,
              "type": type,
              "address": address            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end