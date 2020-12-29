require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateWebhookSubscription < BaseMutation
        argument :id, ID, required: true
        
        
        field :return_value, Boolean, null: false
        
        def resolve(id:)
          context[:canvas_api].call("UPDATE_WEBHOOK_SUBSCRIPTION").proxy(
            "UPDATE_WEBHOOK_SUBSCRIPTION",
            {
              "id": id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end