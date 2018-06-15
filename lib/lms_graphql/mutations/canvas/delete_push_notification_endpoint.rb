require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/canvas{success: true}"
module LMSGraphQL
  module Mutations
    module Canvas
      class DeletePushNotificationEndpoint < CanvasBaseMutation

        field :canvas{success: true}, LMSGraphQL::Types::Canvas::Canvas{success: true}, null: false
        def resolve()
          context[:canvas_api].call("DELETE_PUSH_NOTIFICATION_ENDPOINT").proxy(
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