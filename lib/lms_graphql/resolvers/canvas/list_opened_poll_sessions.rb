require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class ListOpenedPollSession < CanvasBaseResolver
        type Boolean, null: false

        def resolve()
          context[:canvas_api].call("LIST_OPENED_POLL_SESSIONS").proxy(
            "LIST_OPENED_POLL_SESSIONS",
            {
            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end