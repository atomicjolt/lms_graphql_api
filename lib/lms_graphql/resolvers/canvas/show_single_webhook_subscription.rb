require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class ShowSingleWebhookSubscription < CanvasBaseResolver
        type Boolean, null: false
        argument :id, ID, required: true
        def resolve(id:, get_all: false)
          result = context[:canvas_api].call("SHOW_SINGLE_WEBHOOK_SUBSCRIPTION").proxy(
            "SHOW_SINGLE_WEBHOOK_SUBSCRIPTION",
            {
              "id": id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end