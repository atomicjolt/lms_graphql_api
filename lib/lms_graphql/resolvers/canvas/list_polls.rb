require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class ListPoll < CanvasBaseResolver
        type Boolean, null: false

        def resolve()
          context[:canvas_api].call("LIST_POLLS").proxy(
            "LIST_POLLS",
            {
            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end