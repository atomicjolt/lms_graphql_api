require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/bookmark"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetBookmark < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::Bookmark, null: false
        argument :id, ID, required: true
        def resolve(id:)
          context[:canvas_api].proxy(
            "GET_BOOKMARK",
            {
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end