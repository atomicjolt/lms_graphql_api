require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/account_notification"
module LMSGraphQL
  module Mutations
    module Canvas
      class CloseNotificationForUser < CanvasBaseMutation
        argument :account_id, ID, required: true
        argument :id, ID, required: true
        field :account_notification, LMSGraphQL::Types::Canvas::CanvasAccountNotification, null: false
        def resolve(account_id:, id:)
          context[:canvas_api].call("CLOSE_NOTIFICATION_FOR_USER").proxy(
            "CLOSE_NOTIFICATION_FOR_USER",
            {
              "account_id": account_id,
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end