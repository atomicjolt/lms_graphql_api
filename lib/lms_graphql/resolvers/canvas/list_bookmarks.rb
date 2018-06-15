require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/bookmark"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListBookmark < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasBookmark], null: false

        def resolve()
          context[:canvas_api].call("LIST_BOOKMARKS").proxy(
            "LIST_BOOKMARKS",
            {
            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end