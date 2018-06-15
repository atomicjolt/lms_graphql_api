require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class UnreadCount < CanvasBaseResolver
        type Boolean, null: false

        def resolve()
          context[:canvas_api].call("UNREAD_COUNT").proxy(
            "UNREAD_COUNT",
            {
            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end