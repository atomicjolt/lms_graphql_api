require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class ListActivityStreamSelf < CanvasBaseResolver
        type Boolean, null: false

        def resolve()
          context[:canvas_api].proxy(
            "LIST_ACTIVITY_STREAM_SELF",
            {
            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end