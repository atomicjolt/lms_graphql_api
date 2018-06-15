require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/feature"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListFeaturesUser < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasFeature], null: false
        argument :user_id, ID, required: true
        def resolve(user_id:)
          context[:canvas_api].call("LIST_FEATURES_USERS").proxy(
            "LIST_FEATURES_USERS",
            {
              "user_id": user_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end