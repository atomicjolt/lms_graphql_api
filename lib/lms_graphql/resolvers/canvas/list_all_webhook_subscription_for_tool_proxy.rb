require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class ListAllWebhookSubscriptionForToolProxy < CanvasBaseResolver
        type Boolean, null: false

        def resolve(get_all: false)
          result = context[:canvas_api].call("LIST_ALL_WEBHOOK_SUBSCRIPTION_FOR_TOOL_PROXY").proxy(
            "LIST_ALL_WEBHOOK_SUBSCRIPTION_FOR_TOOL_PROXY",
            {
            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end