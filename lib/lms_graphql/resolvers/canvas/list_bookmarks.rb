require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/bookmark"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListBookmark < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasBookmark], null: false
        argument :get_all, Boolean, required: false

        def resolve(get_all: false)
          result = context[:canvas_api].call("LIST_BOOKMARKS").proxy(
            "LIST_BOOKMARKS",
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