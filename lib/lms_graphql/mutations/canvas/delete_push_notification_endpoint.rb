require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class DeletePushNotificationEndpoint < BaseMutation

        field :return_value, String, null: false
        def resolve()
          context[:canvas_api].call("DELETE_PUSH_NOTIFICATION_ENDPOINT").proxy(
            "DELETE_PUSH_NOTIFICATION_ENDPOINT",
            {},
            {},
          ).parsed_response
        end
      end
    end
  end
end