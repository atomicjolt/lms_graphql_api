require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteWebhookSubscription < CanvasBaseMutation
        argument :id, ID, required: true
        field :return_value, Boolean, null: false
        def resolve(id:)
          context[:canvas_api].call("DELETE_WEBHOOK_SUBSCRIPTION").proxy(
            "DELETE_WEBHOOK_SUBSCRIPTION",
            {
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end