require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/group"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListFavoriteGroup < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::Group], null: false

        def resolve()
          context[:canvas_api].proxy(
            "LIST_FAVORITE_GROUPS",
            {
            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end