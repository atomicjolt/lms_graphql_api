require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class ListEnabledFeaturesUser < CanvasBaseResolver
        type Boolean, null: false
        argument :user_id, ID, required: true
        def resolve(user_id:)
          context[:canvas_api].call("LIST_ENABLED_FEATURES_USERS").proxy(
            "LIST_ENABLED_FEATURES_USERS",
            {
              "user_id": user_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end