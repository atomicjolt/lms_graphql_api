require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/feature"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListFeaturesAccount < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasFeature], null: false
        argument :account_id, ID, required: true
        def resolve(account_id:)
          context[:canvas_api].call("LIST_FEATURES_ACCOUNTS").proxy(
            "LIST_FEATURES_ACCOUNTS",
            {
              "account_id": account_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end