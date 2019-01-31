require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/group"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListFavoriteGroup < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasGroup], null: false
        argument :get_all, Boolean, required: false

        def resolve(get_all: false)
          result = context[:canvas_api].call("LIST_FAVORITE_GROUPS").proxy(
            "LIST_FAVORITE_GROUPS",
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