require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/bookmark"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetBookmark < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasBookmark, null: false
        argument :id, ID, required: true
        def resolve(id:, get_all: false)
          result = context[:canvas_api].call("GET_BOOKMARK").proxy(
            "GET_BOOKMARK",
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