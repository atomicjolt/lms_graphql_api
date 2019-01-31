require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class UnreadCount < CanvasBaseResolver
        type Boolean, null: false

        def resolve(get_all: false)
          result = context[:canvas_api].call("UNREAD_COUNT").proxy(
            "UNREAD_COUNT",
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