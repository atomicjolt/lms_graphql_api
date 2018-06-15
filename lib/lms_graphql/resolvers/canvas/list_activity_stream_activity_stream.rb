require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class ListActivityStreamActivityStream < CanvasBaseResolver
        type Boolean, null: false

        def resolve()
          context[:canvas_api].call("LIST_ACTIVITY_STREAM_ACTIVITY_STREAM").proxy(
            "LIST_ACTIVITY_STREAM_ACTIVITY_STREAM",
            {
            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end