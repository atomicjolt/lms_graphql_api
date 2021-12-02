require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class CreateWebhookSubscription < BaseMutation
        argument :subscription_ContextId, String, required: true
        argument :subscription_ContextType, String, required: true
        argument :subscription_EventTypes, [String], required: true
        argument :subscription_Format, String, required: true
        argument :subscription_TransportMetadata, String, required: true
        argument :subscription_TransportType, String, required: true
        
        
        field :return_value, Boolean, null: false
        
        def resolve(subscription_ContextId:, subscription_ContextType:, subscription_EventTypes:, subscription_Format:, subscription_TransportMetadata:, subscription_TransportType:)
          context[:canvas_api].call("CREATE_WEBHOOK_SUBSCRIPTION").proxy(
            "CREATE_WEBHOOK_SUBSCRIPTION",
            {},
            {
              "subscription[ContextId]": subscription_ContextId,
              "subscription[ContextType]": subscription_ContextType,
              "subscription[EventTypes]": subscription_EventTypes,
              "subscription[Format]": subscription_Format,
              "subscription[TransportMetadata]": subscription_TransportMetadata,
              "subscription[TransportType]": subscription_TransportType
            },
          ).parsed_response
        end
      end
    end
  end
end