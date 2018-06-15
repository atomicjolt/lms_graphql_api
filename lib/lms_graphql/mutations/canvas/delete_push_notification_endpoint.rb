require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/{success: true}"
module LMSGraphQL
  module Mutations
    module Canvas
      class DeletePushNotificationEndpoint < CanvasBaseMutation

        field :{success: true}, LMSGraphQL::Types::Canvas::{success: true}, null: false
        def resolve()
          ctx[:canvas_api].proxy(
            "DELETE_PUSH_NOTIFICATION_ENDPOINT",
            {
            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end