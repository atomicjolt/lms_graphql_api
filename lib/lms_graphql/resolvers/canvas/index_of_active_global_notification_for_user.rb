require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/account_notification"
module LMSGraphQL
  module Resolvers
    module Canvas
      class IndexOfActiveGlobalNotificationForUser < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasAccountNotification], null: false
        argument :account_id, ID, required: true
        def resolve(account_id:)
          context[:canvas_api].call("INDEX_OF_ACTIVE_GLOBAL_NOTIFICATION_FOR_USER").proxy(
            "INDEX_OF_ACTIVE_GLOBAL_NOTIFICATION_FOR_USER",
            {
              "account_id": account_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end